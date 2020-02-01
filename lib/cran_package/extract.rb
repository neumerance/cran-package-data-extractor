module CranPackage
  class Extract
    BASE_URL = 'https://cran.r-project.org/web/packages'.freeze

    def initialize(package_name)
      @package_name = package_name
      @package_page_url = "#{BASE_URL}/#{@package_name}/"
    end

    def extract
      {
        package_name: @package_name,
        description: package_description,
        **package_summary
      }
    end

    private

    def package_full_url
      URI.join(@package_page_url , package_uri)
    end

    def html
      doc = HTTParty.get(@package_page_url)
      raise Exceptions::UnableToReachPackageRepositor unless doc.success?
      @html ||= Nokogiri::HTML(doc)
    end

    def package_uri
      @package_uri ||= html.search("table[summary='Package #{@package_name} downloads']").
                            css('a')[1]['href']
    end

    def package_description
      @package_description = html.css('p').
        first.text.try(:squish).try(:squeeze)
    end

    def package_summary
      summary = Hash.new
      table = html.search("table[summary='Package #{@package_name} summary']")
      if table.any?
        @package_summary ||= table.first.css('tr').each do |tr|
          next unless tr.css('td').any?

          label = tr.css('td')[0].try(:text)
          value = tr.css('td')[1].try(:text)

          next unless label.present? && value.present?
          label = label.parameterize.underscore.to_sym
          summary[label] =  if [:author, :maintainer].include?(label)
                              value.split(',').map { |s| s.split(' and ') }.
                                flatten.map(&:presence).compact.map do |user|
                                Sanitize.sanitize_user_data(user)
                              end
                            else
                              Sanitize.sanitize(value.squish.squeeze)
                            end
        end
      end
      summary
    end
  end
end

module CranPackage
  class Download
    BASE_URL = 'https://cran.r-project.org/web/packages'.freeze

    def initialize(package_name)
      @package_name = package_name.downcase
      @package_page_url = "#{BASE_URL}/#{@package_name}/"
    end

    def download
      doc = HTTParty.get(@package_page_url)
      html = Nokogiri::HTML(doc)
      @package_uri = html.search('table[summary="Package abc.data downloads"]').
                      css('tr')[1].css('a').first['href']
      save_to_tmp
    end

    private

    def package_full_url
      URI.join(@package_page_url , @package_uri)
    end

    def save_to_tmp
      tmp = "tmp/#{File.basename(package_full_url.path)}"
      File.open(tmp, 'w') do |file|
        file.binmode
        file.write(binary)
      end
      tmp
    end

    def binary
      response = HTTParty.get(package_full_url, stream_body: true)
      if response.success?
        response
      else
        raise 'Unable to reach the package source url'
      end
    end
  end
end

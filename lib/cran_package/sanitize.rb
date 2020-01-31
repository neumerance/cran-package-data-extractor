module CranPackage
  class Sanitize
    RULES = [
      {
        target: '[aut, cre]',
        replacement: '',
      },
      {
        target: '[aut]',
        replacement: ''
      },
      {
        target: ' at ',
        replacement: '@'
      },
      {
        target: '<',
        replacement: ''
      },
      {
        target: '>',
        replacement: ''
      }
    ].freeze
    EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i

    class << self
      def sanitize(string)
        RULES.each do |rule|
          string.gsub!(rule[:target], rule[:replacement])
        end
        string.squish.squeeze
      end

      def sanitize_user_data(string)
        sanitized_string = sanitize(string)
        email = extract_email(sanitized_string)
        {
          email: email,
          name: sanitized_string.gsub!(email, '').squish.squeeze
        }
      end

      private

      def extract_email(string)
        string.scan(EMAIL_REGEX).first || ''
      end
    end
  end
end

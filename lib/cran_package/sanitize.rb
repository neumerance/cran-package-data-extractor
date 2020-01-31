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

    def self.sanitize(string)
      RULES.each do |rule|
        string.gsub!(rule[:target], rule[:replacement])
      end
      string.squish.squeeze
    end
  end
end

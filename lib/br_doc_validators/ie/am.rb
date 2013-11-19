require_relative "pattern1"

module ValidaDocs
  module IE
    class AM < Pattern1
      def initialize(number)
        super
        @mask = /^(\d{2}\.\d{3}\.\d{3}\-\d{1})$|^(\d{9})$/
      end
    end
  end
end
require_relative "pattern1"

module ValidaDocs
  module IE
    class PA < Pattern1
      def initialize(number)
        super
        @mask = /^(\d{2}\-\d{6}\-\d{1})$|^(\d{9})$/
      end
    end
  end
end
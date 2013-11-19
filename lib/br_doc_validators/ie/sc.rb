require_relative "pattern1"

module ValidaDocs
  module IE
    class SC < Pattern1
      def initialize(number)
        super
        @mask = /^(\d{3}\.\d{3}\.\d{3})$|^(\d{9})$/
      end
    end
  end
end
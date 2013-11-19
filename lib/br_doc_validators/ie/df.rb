require_relative "pattern2"

module ValidaDocs
  module IE
    class DF < Pattern2
      def initialize(number)
        super
        @mask = /^(\d{11}\-\d{2})$|^(\d{13})$/
      end
    end
  end
end
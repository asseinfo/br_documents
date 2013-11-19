require_relative "pattern2"

module ValidaDocs
  module IE
    class AC < Pattern2
      def initialize(number)
        super
        @mask = /^(\d{2}\.\d{3}\.\d{3}\/\d{3}\-\d{2})$|^(\d{13})$/
      end
    end
  end
end

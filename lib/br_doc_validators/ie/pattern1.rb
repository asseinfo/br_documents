require_relative "base"

module ValidaDocs
  module IE
    class Pattern1 < Base
      include Commons::Mod11

      def initialize(number)
        super
        @mask = /^(\d{8}\-\d{1})$|^(\d{9})$/
        @weight = [9, 8, 7, 6, 5, 4, 3, 2]
      end

      private
      def valid_format?
        regex = @mask
        regex.match(@number).present?
      end

      def valid_digital_check?
        @number.gsub!(/[\.\/-]/, "")
        @number[-1].eql? generate_digital_check(@number, @weight).to_s
      end
    end
  end
end

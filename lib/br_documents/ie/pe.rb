require_relative 'pattern1'
require_relative 'pattern2'

module BrDocuments
  module IE
    class PE
      def initialize(number)
        @validator = if number.gsub(/[\.\/-]/, '').length <= 9
                       PE9.new(number)
                     else
                       PE14.new(number)
                     end
      end

      def valid?
        @validator.valid?
      end

      def formatted
        @validator.formatted
      end

      class PE14 < Pattern1
        def initialize(number)
          super
          @mask = /^(\d{2}\.\d{1}\.\d{3}\.\d{7}\-\d{1})$|^(\d{14})$/
          @weight = [5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2]
        end

        private

        def format_ie(number)
          number.sub(/(\d{2})(\d{1})(\d{3})(\d{7})(\d{1})/, '\\1.\\2.\\3.\\4-\\5')
        end
      end
      private_constant :PE14

      class PE9 < Pattern2
        def initialize(number)
          super
          @mask = /^(\d{7}\-\d{2})$|^(\d{9})$/
          @weight1 = [8, 7, 6, 5, 4, 3, 2]
          @weight2 = [9, 8, 7, 6, 5, 4, 3, 2]
        end

        private

        def format_ie(number)
          number.sub(/(\d{7})(\d{2})/, '\\1-\\2')
        end
      end

      private_constant :PE9
    end
  end
end

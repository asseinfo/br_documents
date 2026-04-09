module BrDocuments
  module Commons
    module Mod11
      def generate_check_digit(values, weights)
        sum = reduce_weights(values, weights)
        mod = sum % 11
        mod < 2 ? 0 : (11 - mod)
      end

      # Converts each character to a numeric value for the modulo-11 calculation.
      #
      # The new CNPJ format (Receita Federal, effective July 2026) allows uppercase
      # letters in the first 12 characters (root + filial). `char.to_i` can't handle
      # this — it returns 0 for any non-digit.
      #
      # `char.ord - 48` works because 48 is the ASCII code of '0', giving us:
      #   '0'.ord - 48 # => 0    '9'.ord - 48 # => 9    (same as char.to_i)
      #   'A'.ord - 48 # => 17   'B'.ord - 48 # => 18   'Z'.ord - 48 # => 42
      #
      # This is the character mapping defined by the Receita Federal specification
      # and is backwards-compatible with CPF (digits only).
      def reduce_weights(values, weights)
        sum = 0
        weights.each_index do |i|
          sum += weights[i] * (values[i].ord - 48)
        end
        sum
      end
    end
  end
end

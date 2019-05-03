module BrDocuments
  class Gtin
    def initialize(code)
      @code = code
    end

    def valid?
      valid_length? && valid_checksum?
    end

    private

    def valid_length?
      [8, 12, 13, 14].include?(@code.length)
    end

    def valid_checksum?
      numbers = @code.chars[0, @code.length - 1].reverse
      odd = even = 0

      numbers.each_with_index do |number, i|
        (i + 1).even? ? (even += number.to_i) : (odd += number.to_i * 3)
      end

      @code.chars.last.to_i == (10 - (odd + even) % 10)
    end
  end
end
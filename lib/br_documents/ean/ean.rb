module BrDocuments
  class Ean
    def initialize(code)
      @code = code
    end

    def valid?
      if valid_length?
        current_checksum = @code.chars.last.to_i
        calculated_checksum = checksum

        current_checksum.eql?(calculated_checksum)
      end
    end

    private

    def valid_length?
      [8, 13, 14].include?(@code.length)
    end

    def checksum
      numbers = @code.chars[0, @code.length - 1].reverse
      odd = even = 0

      numbers.each_with_index do |number, i|
        (i + 1).even? ? (even += number.to_i) : (odd += number.to_i * 3)
      end

      (10 - (odd + even) % 10)
    end
  end
end
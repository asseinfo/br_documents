module ValidaDocs
  module IE
    class Factory
      def self.create(uf, number)
        if ["CE", "ES", "MA", "MS", "PB", "PI", "SE"].include?(uf)
          ValidaDocs::IE::Pattern1.new(number)
        else
          klass = ValidaDocs::IE.const_get("#{uf}")
          klass.new(number)
        end
      rescue NameError
        raise(ArgumentError, I18n.t("validator.ie.uf.invalid"))
      end
    end
  end
end
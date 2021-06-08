module BrDocuments
  module IE
    class Factory
      def self.create(uf_symbol, number)
        klass = IE.const_get(uf_symbol.to_s)
        klass.new(number)
      rescue NameError
        raise(ArgumentError, I18n.t('validator.ie.uf.invalid'))
      end
    end
  end
end

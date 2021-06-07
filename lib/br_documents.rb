require "active_model"

Dir[File.dirname(__FILE__) + "/**/*.rb"].sort.each { |f| require f }

I18n.load_path << File.expand_path("../config/locales/pt-BR.yml", __dir__)

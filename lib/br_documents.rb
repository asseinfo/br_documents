require "active_model"

Dir[File.dirname(__FILE__) + "/**/*.rb"].each { |f| require f }

I18n.load_path << File.expand_path("../../config/locales/pt-BR.yml", __FILE__)

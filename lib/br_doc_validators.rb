require "active_model"
Dir[File.dirname(__FILE__) + "/**/*.rb"].each { |f| require f }

I18n.load_path += Dir.glob(File.expand_path('../../config/locales/**/*',__FILE__))
I18n.default_locale = "pt-BR"

require "simplecov"
SimpleCov.start

require "bundler/setup"
Bundler.require(:default, :development)

require "br_documents"

Dir[File.dirname(__FILE__) + "/support/*.rb"].each { |f| require f }

I18n.default_locale = "pt-BR"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = "random"
end

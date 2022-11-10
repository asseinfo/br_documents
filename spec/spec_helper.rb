require 'simplecov'
SimpleCov.start unless ENV['NO_COVERAGE']

require 'bundler/setup'
Bundler.require(:default, :development)

require 'br_documents'

Dir["#{File.dirname(__FILE__)}/support/*.rb"].sort.each { |f| require f }

I18n.default_locale = 'pt-BR'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = 'random'
end

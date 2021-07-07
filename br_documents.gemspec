lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'br_documents/version'

# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  spec.name          = 'br_documents'
  spec.version       = BrDocuments::VERSION
  spec.authors       = ['ASSEINFO - Sistemas de Informação']
  spec.email         = ['asseinfo@asseinfo.com.br']
  spec.description   = 'Validates brazilian documents like CPF, CNPJ and IE.'
  spec.summary       = 'Validates brazilian documents like CPF, CNPJ and IE. It can be used with active record '\
                       'or just in ruby.'
  spec.homepage      = 'http://github.com/asseinfo/br_documents'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activemodel', '>= 4.0.0'
  spec.add_dependency 'i18n', '>= 0.6.5'

  spec.add_development_dependency 'bundler', '>= 1.3'
  spec.add_development_dependency 'byebug', '11.1.3' if RUBY_VERSION >= '2.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '>= 1.0.7'
  spec.add_development_dependency 'rake', '>= 13.0.3'
  spec.add_development_dependency 'rspec', '>= 3.10.0'
  spec.add_development_dependency 'rubocop', '~> 1.18.3'
  spec.add_development_dependency 'rubocop-performance', '~> 1.11.3'
  spec.add_development_dependency 'rubocop-rails', '~> 2.10.1'
  spec.add_development_dependency 'rubocop-rake', '>= 0.5.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.3.0'
  spec.add_development_dependency 'simplecov', '>= 0.21.2'
end
# rubocop:enable Metrics/BlockLength

# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "br_documents/version"

Gem::Specification.new do |spec|
  spec.name          = "br_documents"
  spec.version       = BrDocuments::VERSION
  spec.authors       = ["ASSEINFO - Sistemas de Informação"]
  spec.email         = ["asseinfo@asseinfo.com.br"]
  spec.description   = "Validates brazilian documents like CPF, CNPJ and IE."
  spec.summary       = "Validates brazilian documents like CPF, CNPJ and IE. It can be used with active record or just in ruby."
  spec.homepage      = "http://github.com/asseinfo/br_documents"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "http://github.com/asseinfo/br_documents"

  spec.add_development_dependency "bundler",            "~> 1.3"
  spec.add_development_dependency "rake",               "~> 10.1.0"
  spec.add_development_dependency "rspec",              "~> 2.14.1"
  spec.add_development_dependency "codeclimate-test-reporter"

  spec.add_runtime_dependency     "activemodel",         "~> 4.0.0"
  spec.add_runtime_dependency     "i18n",                "~> 0.6.5"
end

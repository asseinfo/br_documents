# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "br_doc_validators/version"

Gem::Specification.new do |spec|
  spec.name          = "br_doc_validators"
  spec.version       = BrDocValidators::VERSION
  spec.authors       = ["ASSEINFO - Sistemas de Informação"]
  spec.email         = ["asseinfo@asseinfo.com.br"]
  spec.description   = "Solução para validar documentos brasileiros"
  spec.summary       = "Solução para validar documentos brasileiros"
  spec.homepage      = "http://github.com/asseinfo/br_doc_validators"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "http://github.com/asseinfo/br_doc_validators"

  spec.add_development_dependency "bundler",            "~> 1.3"
  spec.add_development_dependency "rake",               "~> 10.1.0"
  spec.add_development_dependency "rspec",              "~> 2.14.1"

  spec.add_runtime_dependency     "activemodel",         "~> 4.0.0"
  spec.add_runtime_dependency     "i18n",                "~> 0.6.5"
end

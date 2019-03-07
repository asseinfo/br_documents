# BrDocuments

[![Code Climate](https://codeclimate.com/github/asseinfo/br_documents.png)](https://codeclimate.com/github/asseinfo/br_documents) [![Build Status](https://travis-ci.org/asseinfo/br_documents.svg?branch=master)](https://travis-ci.org/asseinfo/br_documents)

This gem validates Brazilian documents for application use. Today it can validate CNPJ, CPF and IE.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "br_documents"
```

And then execute:

```ruby
$ bundle
```

Or install it yourself as:

```ruby
$ gem install br_documents
```

## Usage

### Active Record

#### CNPJ

```ruby
class Person < ActiveRecord::Base

  attr_accessor :cnpj

  validates :cnpj,
    cnpj: true
end


pj = Person.new
pj.cnpj = "85961757000102"
pj.valid? # => true

pj.cnpj = "85.961.757/0001-02" # with mask
pf.valid? # => true

pj.cnpj = "11111111111111"
pj.valid? # => false
```

#### CPF

```ruby
class Person < ActiveRecord::Base

  attr_accessor :cpf

  validates :cpf,
    cpf: true
end


pf = Person.new
pf.cpf = "11144477735"
pf.valid? # => true

pf.cpf = "111.444.777-35" # with mask
pf.valid? # => true

pf.cpf = "111.111.111-11"
pf.valid? # => false
```

#### IE

```ruby
class City < ActiveRecord::Base
  attr_accessor :name, :uf

  has_many :people
end

class Person < ActiveRecord::Base

  attr_accessor :ie

  belongs_to :city

  validates :ie,
    ie: {uf: "city#uf"} # you need to inform how it can get the "uf" attribute
end


c = City.new
c.name = "Tijucas"
c.uf = "SC"

pj = Person.new
pj.city = c

pj.ie = "253667852"
pj.valid? # => true

pj.ie = "253.667.852" # with mask
pj.valid? # => true

c.uf = "SP"
pj.valid? # => false

c.uf = "SC"
pj.ie = "111.111.111"
pj.valid? # => false
```

### Ruby

#### CNPJ

```ruby
require "br_documents"

cnpj = BrDocuments::CnpjCpf::Cnpj.new("04001155000101")
cnpj.formatted # => "04.001.155/0001-01"
cnpj.valid? # => true
```

#### CPF

```ruby
require "br_documents"

cpf = BrDocuments::CnpjCpf::Cpf.new("11144477735")
cpf.formatted # => "111.444.777-35"
cpf.valid? # => true
```

#### IE

```ruby
require "br_documents"

ie = BrDocuments::IE::Factory.create("SC", "254062407")
ie.formatted # => "254.062.407"
ie.valid?    # => true
```

## Environment variables

The following variables are necessary to be set:

Environment var                | Development? | Test? | CI  | Production? | Data
-------------------------------|--------------|-------|-----|-------------|-----
TZ                             | no           | no    | yes | no          | America/Sao_Paulo
BUNDLE_PATH                    | no           | no    | yes | no          | ./vendor/bundle
CC_TEST_REPORTER_ID            | no           | no    | yes | no          | get at codeclimate
RAILS_ENV                      | no           | no    | yes | no          | test

## Deploy to Rubygems

    $ bundle exec rake release  # Create tag vX.X.X, build and push br_documents-X.X.X.gem to Rubygems

You can build or install using one of the above tasks

    $ bundle exec rake build    # Build br_documents-X.X.X.gem into the pkg directory
    $ bundle exec rake install  # Build and install br_documents-X.X.X.gem into system gems

#### Login
    $ gem signin
    $ gem signout

## How to add contributors

    gem owner --add leandrolourenci@gmail.com br_documents

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

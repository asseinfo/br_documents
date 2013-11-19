# BrDocValidators

It validates Brazilian documents for application use. Today it can validate CNPJ, CPF and IE.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "br_doc_validators"
```

And then execute:

```ruby
$ bundle
```

Or install it yourself as:

```ruby
$ gem install br_doc_validators
```

## Usage

### How it can validate a CNPJ

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

### How it can validate a CPF

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

### How it can validate a IE

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

pf.ie = "253667852"
pf.valid? # => true

pf.ie = "253.667.852" # with mask
pf.valid? # => true

c.uf = "SP"
pf.valid? # => false

c.uf = "SC"
pf.ie = "111.111.111"
pf.valid? # => false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

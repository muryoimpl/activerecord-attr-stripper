activerecord-attr-stripper [![Build Status](https://travis-ci.org/muryoimpl/activerecord-attr-stripper.svg?branch=master)](https://travis-ci.org/muryoimpl/activerecord-attr-stripper)
==========================

A ActiveRecord plugin which removes leading and trailing whitespace(include zenkaku space) of attributes before validation.

## Installation

Add this line to your application's Gemfile:
```ruby
    gem 'activerecord-attr-stripper'
```

And then execute:
```ruby
    $ bundle
```
Or install it yourself as:
```ruby
    $ gem install activerecord-attr-stripper
```

## Usage

```ruby
class Post < ActiveRecord::Base
  include ActiveRecord::Attr::Stripper

  strip_attrs :title, :description, blank_to_nil: true
end

post = Post.new(title: ' 　this is title 　', description: '　')
post.valid?
puts post.title       #=> 'this is title'
puts post.description #=> nil
```

`blank_to_nil` option is true, attribute's value returns nil if the attribute is '' after removing leading and tailing whitespace.

## Contributing

1. Fork it ( https://github.com/muryoimpl/activerecord-attr-stripper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

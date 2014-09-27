# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/attr/stripper/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-attr-stripper"
  spec.version       = Activerecord::Attr::Stripper::VERSION
  spec.authors       = ["muryoimpl"]
  spec.email         = ["muryoimpl@gmail.com"]
  spec.summary       = %q{A ActiveRecord plugin which removes leading and trailing whitespace of attributes before validation.}
  spec.description   = %q{A ActiveRecord plugin which removes leading and trailing whitespace of attributes before validation.}
  spec.homepage      = "https://github.com/muryoimpl/activerecord-attr-stripper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "activerecord"
end

# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "xendit/rails/version"

Gem::Specification.new do |spec|
  spec.name = "xendit-rails"
  spec.version = Xendit::Rails::VERSION
  spec.authors = ["Yana Agun Siswanto"]
  spec.email = ["yana.developer@gmail.com"]
  spec.homepage = "http://github.com/bekicot/xendit-rails"
  spec.summary = "Quickly add payment to your rails app using xendit."
  spec.description = "Quickly add payment to your rails app using xendit."
  spec.license = "MIT"

  spec.files = Dir[
    "{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"
  ]

  spec.add_dependency "rails", ">= 5.2.0"
end

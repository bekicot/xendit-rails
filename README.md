# Xendit Rails
A drop in rails engine for receiving payment via xendit.

## Installation
Add the gem to your Gemfile
```
gem 'xendit-rails', github: 'bekicot/xendit-rails'
```

And then execute:
```bash
$ bundle
```

Copy migration files
```bash
$ bin/rails xendit:install:migrations
```

Mount the engine to your routes
```rb
mount Xendit::Rails::Engine => 'xendit-rails'
```

And then add the callback to your xendit account
```
FVA Paid:
https://yourdomain.com/xendit-rails/callbacks/virtual_accounts/paid

FVA Created:
https://yourdomain.com/xendit-rails/callbacks/virtual_accounts/
```

## Support
[Github Issue](https://github.com/issues)
[Email Me](mailto:yana.developer@gmail.com)

Nuhun!!


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# Xendit Rails

A drop in rails engine for receiving payment via xendit.

## Installation

```rb
gem 'xendit-rails', github: 'bekicot/xendit-rails'
```

And then execute:

```bash
$ bundle
Using xendit-rails 0.0.1 from https://github.com/bekicot/xendit-rails.git (at master@50ef229)
```

Copy migration files

```bash
$ bin/rails xendit:install:migrations
Copied migration 20200410225858_create_xendit_virtual_accounts.xendit.rb from xendit
Copied migration 20200410225859_create_xendit_payments.xendit.rb from xendit
```

Mount the engine to your routes

```rb
mount Xendit::Rails::Engine => 'xendit-rails'
```

And then add the callback to your xendit account

- FVA Paid: `https://yourdomain.com/xendit-rails/callbacks/virtual_accounts/paid`
- FVA Created: `https://yourdomain.com/xendit-rails/callbacks/virtual_accounts/`

## Support

- [Github Issue](https://github.com/bekicot/xendit-rails/issues)
- [Email Me](mailto:yana.developer@gmail.com)

Nuhun!!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

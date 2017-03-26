# RailsAdminJsonTranslate
This gem integrates [json_translate](https://github.com/cfabianski/json_translate) into [rails_admin](https://github.com/sferik/rails_admin). It aims to provide a reasonably good interface for managing translations. It does so by grouping translations into a tabbed interface, having full language names and accompanying [country flags](https://github.com/richardvenneman/emoji_flag) allowing for good scannability.

[![Travis](https://img.shields.io/travis/richardvenneman/rails_admin_json_translate.svg?style=flat-square)](https://travis-ci.org/richardvenneman/rails_admin_json_translate)
[![Gem](https://img.shields.io/gem/v/rails_admin_json_translate.svg?style=flat-square)](https://rubygems.org/gems/rails_admin_json_translate)

![screenshot](https://cloud.githubusercontent.com/assets/75705/23833356/7c448ddc-0744-11e7-83fc-22eb1851d060.png)

## Usage
First make sure you've setup [json_translate](https://github.com/cfabianski/json_translate) for your models. You'll then need update your rails_admin configuration:

```ruby
RailsAdmin.config do |config|
  ...

  config.model 'Post' do
    configure :title_translations, :json_translate

    # Overriding locales
    configure :body_translations, :json_translate do
      locales %w(nl zh)
    end
  end
end
```

By default, rails_admin_json_translate uses the `I18n.available_locales` locales to create the tabbed interface. However you can specify the locales to use on a per-field basis as shown above.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_admin_json_translate'
```

And then execute:
```bash
$ bundle
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

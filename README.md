# MngNewsletter

A small Newsletter engine that you can plug into an existing Ruby on Rails application and get a ready to use newsletter signup form + admin section + emailing capabilities

## Getting Started

MngNewsletter works with Rails 4.1.5 onwards (previous versions weren't tested but should workd just fine). You can add it to your Gemfile with:

```
gem 'mng_newsletter'
```

Run the bundle command to install it.

```
bundle install
```

After you install MngNewsletter and add it to your Gemfile, you need to install it's migrations:

```
rake mng_newsletter_engine:install:migrations
```

MIT License. Copyright 2014 Mix & Go. http://mixandgo.com

Follow Us: [@mixandgo](https://twitter.com/mixandgo)

You are not granted rights or licenses to the trademarks of the Mix & Go, including without limitation the MngNewsletter name or logo.

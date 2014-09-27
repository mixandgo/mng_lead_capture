# MNGLeadCapture

A small lead capture engine that you can plug into an existing Ruby on Rails application and get a ready to use newsletter signup form + admin section + emailing capabilities

## Getting Started

MNGLeadCapture works with Rails 4.1.5 onwards (previous versions weren't tested but should workd just fine). You can add it to your Gemfile with:

```
gem 'mng_lead_capture'
```

Run the bundle command to install it.

```
bundle install
```

After you install MNGLeadCapture and add it to your Gemfile, you need to install it's migrations:

```
rake mng_lead_capture_engine:install:migrations
```

Add the signup partial to one of your views, for example:

```
<div id="sidebar" class="col-sm-4">
  <%= render "shared/lead_signup_form" %>
</div>
```


MIT License. Copyright 2014 Mix & Go. http://mixandgo.com

Follow Us: [@mixandgo](https://twitter.com/mixandgo)

You are not granted rights or licenses to the trademarks of the Mix & Go, including without limitation the MNGLeadCapture name or logo.

sexxy-emails
============

[![Build Status](https://travis-ci.org/craigmcnamara/sexxy-emails.png)](https://travis-ci.org/craigmcnamara/sexxy-emails)

It's the year 2012 and we sitll have to fight with HTML and CSS compatability in HTML email clients.

Tell the truth, your email styles are probably totally separate for your app. They're probably all just sitting in a messy pile in a template somewhere, aren't they?

Screw that! Got a styleguide? Use your styleguide! And your preprocessors too. Import a compiled CSS file in to your template and let sexxy-emails inline all of those styles. Do you still have to QA it, of course. But you can use your existing tools and templating best practices to make an ugly email template a maintainable part of your application.

**_Coming Soon_**

Also, most of the time you need to do things like adding Google Analytics or some other kind of inbound link tracking and overriding your link helpers is tiring and messy.

[For General David H. Petraeus](http://www.youtube.com/watch?v=fu3L8VBAuJ8&feature=related)

## Why

Everything I've seen is complicated. Sometimes simple is good. Some people use [Sinatra](http://www.sinatrarb.com/), sometimes people use [Jammit](http://documentcloud.github.com/jammit/) for managing their assets. If you can precompile your CSS you can use sexxy-emails to start taming your email templates.

## Install

Add it to your gemfile or:

```
gem install sexxy-emails
```

## Usage

### Mailer

Somewhere in your action mailer `include SexxyEmails` thats it.

```
class TestMailer < ActionMailer::Base
  include SexxyEmails

  def basic_css
    mail(:to => "sexxy-email@test.com", :subject => "Test email subject line")
  end
end
```

### Template

Then in the view you can use `stylesheet_include_tag` to pull a precompiled stylesheet in to the template. Sorry no dynamic SASS compilation built in yet. It looks in `public/stylesheets` currently.

```
<!DOCTYPE html>
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
    <%= stylesheet_include_tag 'basic' %>
  </head>
  <body>
    <h1>Welcome to example.com</h1>
    <p>
      This email should have some inline styles.<br/>
    </p>
    <p>
      <%= link_to "Internal link", root_url %>
    </p>
    <p>I hope they look great.</p>
  </body>
</html>
```

### Output

Inline styles for cranky email clients.

```
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
<body>
    <h1>Welcome to example.com</h1>
    <p style="font-size: 36px; font-family: Helvetica, sans-serif;">
      This email should have some inline styles.<br></p>
    <p style="font-size: 36px; font-family: Helvetica, sans-serif;">
      <a href="http://sexxy-emails.example.com/">Internal link</a>
    </p>
    <p style="font-size: 36px; font-family: Helvetica, sans-serif;">I hope they look great.</p>
  </body>
</html>
```

## Features

* Inline the CSS in email templates.
* Include pre-compiled CSS in to a template for inlining.

## Upcoming Features.

* Sexxy inbound link parameters for tracking. (coming very soon.)
* Don't depend on precompiled CSS (maybe?)
* Use asset pipeline in development and test (maybe).
* Think of something and ask for it.

## Goals

The goal of this project is make common problems with designing and supporting HTML emails simple and easy on the eyes, you know sexxy.

## Contributions

* Fork it
* Make a topic branch
* Send a pull request.



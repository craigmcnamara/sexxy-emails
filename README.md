sexxy-emails
============

[![Build Status](https://travis-ci.org/craigmcnamara/sexxy-emails.png)](https://travis-ci.org/craigmcnamara/sexxy-emails)

It's the year 2012 and we sill have to fight with HTML and CSS compatability in HTML email clients.

Also, most of the time you need to do things like adding Google Analytics or some other kind of inbound link tracking and overriding your link helpers is tiring and messy. Well, other people have made gems, but the code I've read is very un-sexxy. So the goal of this is to make a simple, readable Rails solution for designing emails that works, you know sexxy.

[Inspired by TMBG](http://www.youtube.com/watch?v=fu3L8VBAuJ8&feature=related)

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
* Include Precompiled CSS in to a template for inlining.

## Upcoming Features.

* Don't depend on precompiled CSS (maybe?)
* Sexxy inbound link parameters for tracking.
* Use asset pipeline in development and test (maybe).
* Think of something and ask for it.

## Contributions

* Fork it
* Make a topic branch
* Send a pull request.



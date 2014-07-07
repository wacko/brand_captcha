brand_captcha
=============

A BrandCAPTCHA library for ruby

Description
-----------

API to interact with BrandCAPTCHA

## Installation

```
$ gem install brand_captcha
```

## Usage

```
BrandCaptcha.configure do |c|
  c.public_key = ENV['BRANDCAPTCHA_PUBLIC_KEY']
  c.private_key = ENV['BRANDCAPTCHA_PRIVATE_KEY']
end
```


On the view, inside the <form>
```
<%= BrandCaptcha.widget =>
```

To validate the captcha:
```
valid = BrandCaptcha.check_answer remote_ip, challenge, response
```

## Acknowledgement
Based on [BrandCaptcha plugin](http://www.pontamedia.com/) for WordPress and [reCAPTCHA](http://recaptcha.net)

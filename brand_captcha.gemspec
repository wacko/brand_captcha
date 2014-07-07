# encoding: utf-8

Gem::Specification.new do |s|
  s.name              = "brand_captcha"
  s.version           = "0.0.2"
  s.summary           = "A BrandCAPTCHA library"
  s.description       = "API to interact with BrandCAPTCHA\nhttp://www.pontamedia.com/en/brandcaptcha/"
  s.authors           = ["Joaquín Vicente"]
  s.email             = ["joakin@gmail.com"]
  s.homepage          = "https://github.com/wacko/brand_captcha"
  s.files             = Dir["lib/brand_captcha.rb", "README.md", "LICENSE", "brand_captcha.gemspec"]

  s.license           = "MIT"
  s.executables.push("brand_captcha")
  s.add_development_dependency "cutest", "~> 1"
end

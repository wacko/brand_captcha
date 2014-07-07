# encoding: utf-8

Gem::Specification.new do |s|
  s.name              = "brand_captcha"
  s.version           = "0.0.1"
  s.summary           = "A BrandCAPTCHA library"
  s.description       = "A BrandCAPTCHA library"
  s.authors           = ["Joaquín Vicente"]
  s.email             = ["joakin@gmail.com"]
  s.homepage          = "http://www.pontamedia.com/en/brandcaptcha/"
  s.files             = []
  s.files             = Dir["lib/brand_captcha.rb", "README.md", "LICENSE", "brand_captcha.gemspec"]

  s.license           = "MIT"
  s.executables.push("brand_captcha")
  s.add_development_dependency "cutest"
end

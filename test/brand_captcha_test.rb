require File.expand_path("../lib/brand_captcha", File.dirname(__FILE__))

prepare do
  BrandCaptcha.configure do |c|
    c.public_key = '11111111'
    c.private_key = '22222222'
  end
end

test "generates a widget" do
  expected = "<script type='text/javascript' src='//api.pontamedia.net/challenge.php?k=11111111'></script>"
  assert_equal expected, BrandCaptcha.widget
end

test "generates a widget with error" do
  expected = "<script type='text/javascript' src='//api.pontamedia.net/challenge.php?k=11111111&error=error_message'></script>"
  assert_equal expected, BrandCaptcha.widget('error_message')
end

test "check_answer requires an private_key" do
  assert_raise BrandCaptcha::Error do
    BrandCaptcha.check_answer(nil, nil, nil, nil)  
  end
end

test "discard empty challenges" do
  assert_equal false, BrandCaptcha.check_answer('1.1.1.1', nil, nil)
end


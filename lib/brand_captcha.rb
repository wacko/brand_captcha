require 'net/http'

class BrandCaptcha
  Configuration = Struct.new(:public_key, :private_key)

  API_HOST       = 'api.pontamedia.net'
  VERIFY_PATH    = '/verify.php'
  CHALLENGE_PATH = '/challenge.php'

  Error = Class.new(StandardError)

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    self.configuration
    yield(configuration)
  end

  def self.widget error=nil
    raise Error.new('To use BrandCaptcha you must get an API Key') if configuration.public_key.to_s.empty?
    url = '//' + API_HOST + CHALLENGE_PATH
    error_part = error ? "&error=#{error}" : ""

    "<script type='text/javascript' src='#{url}?k=#{configuration.public_key}#{error_part}'></script>";
  end

  def self.check_answer remote_ip, challenge, response, extra_params={}
    raise Error.new('To use BrandCaptcha you must get an API key') if configuration.private_key.to_s.empty?
    raise Error.new('For security reasons, you must pass the remote ip to BrandCaptcha') if remote_ip.to_s.empty?
    return false if challenge.to_s.empty? or response.to_s.empty?

    params = { privatekey: configuration.private_key, remoteip: remote_ip, challenge: challenge, response: response }.merge extra_params
    uri = URI('http://' + API_HOST + VERIFY_PATH)
    res = Net::HTTP.post_form(uri, params)
    res.body =~ /true/
  end

end

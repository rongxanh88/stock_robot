require 'uri'
require 'net/https'
require 'json'

class TradierAPI
  attr_reader :endpoint

  KEY = {
      :api => ENV[“TRADIER_API_KEY”]
  }

  def initialize(endpoint)
    @endpoint = endpoint
  end

  def get_report(stock_symbol)
    uri = generate_uri(stock_symbol)
    http = generate_http(uri)
    request_header = generate_header(uri)

    response = http.request(request_header)
    JSON.parse(response.body)
  end

  private

  def generate_uri(stock_symbol)
    url = endpoint + "symbols=#{stock_symbol}"
    URI.parse(url)
  end

  def generate_http(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.read_timeout = 30
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    http
  end

  def generate_header(uri)
    request = Net::HTTP::Get.new(uri.request_uri)
    request["Accept"] = "application/json"
    request["Authorization"] = "Bearer #{KEY[:api]}"
    request
  end
end
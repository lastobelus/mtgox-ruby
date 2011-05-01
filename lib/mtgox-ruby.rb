require 'net/http'
require 'rubygems'
require 'json'

$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'mtgox_order'
  
class MtgoxClient

  MTGOX_API_URL = "http://mtgox.com/code/data/"
  
  attr_accessor :api_url

  def initialize(url=nil)
    self.api_url = url || MTGOX_API_URL   
  end
	
  def ticker_data
    raise "implement me"
  end
	
  def market_depth
    raise "implement me"
  end
	
  def recent_trades
    json = JSON.parse(submit_request('getTrades.php'))
    orders = json.map do |trade_json|
      MtgoxOrder.from_json(trade_json)
    end
    return orders
  end
	
  def current_balance
    raise "implement me"
  end
  
  def open_orders
    raise "implement me"
  end
  
  def cancel_order(order)
    raise "implement me"
  end
  
  def place_order(order)
    raise "implement me"
  end  
  
  def send_bitcoin(amount, bitcoin_address)
    raise "implement me"
  end
  
private

  def submit_request_with_credentials(command, data_hash={})
    submit_request(command, data_hash.merge(
      :user => @username,
      :pass => @password
    ))
  end

  def submit_request(command, data_string_or_hash="")    
    uri = URI::parse(self.api_url+command) 
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'
    resp, resp_data = http.post(uri.path, build_request_data(data_string_or_hash), nil)
    return resp_data
  end
  
  def build_request_data(data_string_or_hash="")
    if data_string_or_hash.is_a?(Hash)
      return "?" + data_string_or_hash.to_a.map{ |param| "#{param[0]}=#{param[1]}" }.join("&")
    else
      return data_string_or_hash
    end
  end
 
end

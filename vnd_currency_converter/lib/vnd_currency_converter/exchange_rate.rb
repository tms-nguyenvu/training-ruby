require "net/http"
require "json"

module VndCurrencyConverter
  class ExchangeRate
    API_URL = "https://api.exchangerate-api.com/v4/latest/USD"

    def get_rates
      response = Net::HTTP.get(URI(API_URL))
      json = JSON.parse(response)
      json["rates"] || {}
    rescue 
      puts "Không thể lấy tỷ giá, sử dụng mặc định!"
      { "VND" => 1, "USD" => 0.000041, "EUR" => 0.000038, "JPY" => 0.006 } 
    end
  end
end
require "vnd_currency_converter"

rates = VndCurrencyConverter::ExchangeRate.new
converter = VndCurrencyConverter::Converter.new(rates)

puts converter.convert(1000000, "VND", "USD") # Chuyển 1 triệu VND sang USD
puts converter.convert(100, "USD", "VND") # Chuyển 100 USD sang VND

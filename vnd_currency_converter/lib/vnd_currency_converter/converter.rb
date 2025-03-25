module VndCurrencyConverter
  class Converter
    def initialize(rate_provider)
      @rate_provider = rate_provider
    end

    def convert(amount, from_currency, to_currency)
      rates = @rate_provider.get_rates
      from_rate = rates[from_currency.upcase]
      to_rate = rates[to_currency.upcase]

      if from_rate.nil? || to_rate.nil?
        raise "Tỷ giá không hợp lệ cho #{from} hoặc #{to}"
      end

      (amount / from_rate * to_rate).round(2)
    end
  end
  
end
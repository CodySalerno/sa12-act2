require 'httparty'
require 'json'

response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")

if 199 < response.code && response.code < 300
  crypto_data = JSON.parse(response.body)

  sorted_data = crypto_data.sort_by { |crypto| -crypto['market_cap'] }

  sorted_data.first(5).each_with_index do |crypto, index|
    puts "Name: #{crypto['name']} Price: $#{crypto['current_price']} Market Cap: $#{crypto['market_cap']}"
  end
else
  puts "Couldn't get crypto data from CoinGecko"
end

require "httparty"

response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
body = JSON.parse(response.body)

fields = ["name", "current_price", "market_cap"]
parsed_body = []

# Reduce body to only include relevant fields
body.each do |crypto|
  parsed_body << crypto.select! {|key, value| fields.include? key}
end

# Sort by market cap descending
parsed_body.sort_by! { |crypto| crypto["market_cap"] }.reverse!

# Output
top_five_cryptos = parsed_body.first(5)
top_five_cryptos.each do |crypto|
  puts "Name: #{crypto["name"]}, Current price: #{crypto["current_price"]}, Market cap: #{crypto["market_cap"]}"
end

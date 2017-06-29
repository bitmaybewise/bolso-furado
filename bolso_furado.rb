require "pocket-ruby"
require "date"

Pocket.configure do |config|
  config.consumer_key = ENV.fetch("POCKET_CONSUMER_KEY")
end

access_token = ENV.fetch("POCKET_ACCESS_TOKEN")
username= ENV.fetch("POCKET_USERNAME")

client = Pocket.client(access_token: access_token)
info = client.retrieve(detailType: "simple", tag: "_untagged_")

items = info["list"].map do |(k, v)|
  timestamp = v["time_added"].to_i
  { title: v["given_title"],
    time: Time.at(timestamp).to_date
  }
end

TWO_WEEKS_AGO = Date.today - 14

old_articles = items.select { |item| item[:time] <= TWO_WEEKS_AGO }
new_articles = items.select { |item| item[:time] > TWO_WEEKS_AGO }

puts new_articles
puts "#{new_articles.size} new item(s) found"
puts "#{old_articles.size} old item(s) to tag as old"
require "date"
require "pocket-ruby"

class BolsoFurado
  def initialize(opts)
    @opts = opts
    @opts[:days] ||= 30
  end
  
  def execute!
    Pocket.configure do |config|
      config.consumer_key = @opts[:key]
    end

    client = Pocket.client(access_token: @opts[:token])
    info = client.retrieve(detailType: "simple", tag: "_untagged_")

    items = info["list"].map do |(k, v)|
      timestamp = v["time_added"].to_i
      OpenStruct.new(title: v["given_title"],
                    time: Time.at(timestamp).to_date,
                    item_id: v["item_id"])
    end

    days_ago = Date.today - @opts[:days]

    old_articles = items.select { |item| item[:time] <= days_ago }
    new_articles = items.select { |item| item[:time] > days_ago }

    puts "#{new_articles.size} new item(s) found"
    puts "#{old_articles.size} old item(s) to tag as old"

    items_to_tag = old_articles.map do |article|
      {
        "action" => "tags_add",
        "item_id" => article.item_id,
        "tags" => "bolso-furado",
        "time" => Time.now.to_i
      }
    end

    if items_to_tag.size > 0
      result = client.modify(items_to_tag)
      p result
    end

    puts "#{items_to_tag.size} tagged as bolso-furado"
  end
end

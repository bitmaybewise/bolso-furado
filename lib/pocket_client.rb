require "pocket-ruby"

class PocketClient
  def initialize(consumer_key, consumer_token)
    Pocket.configure do |config|
      config.consumer_key = consumer_key
    end
    @consumer_token = consumer_token
  end

  def retrieve_untagged
    info = client.retrieve(detailType: "simple", tag: "_untagged_")
    info["list"].map { |(item_id, value)| build_item(value) }
  end

  def tag_as_bolso_furado(old_items)
    old_items
      .map(&method(:build_item_to_modify))
      .tap(&method(:modify_items!))
  end
  
  private
  
  def client
    @client ||= Pocket.client(access_token: @consumer_token)
  end

  def build_item(hash)
    timestamp = hash["time_added"].to_i
    OpenStruct.new(title: hash["given_title"], 
                   added_at: Time.at(timestamp).to_date, 
                   item_id: hash["item_id"])
  end

  def build_item_to_modify(item)
    { "action" => "tags_add",
      "item_id" => item.item_id,
      "tags" => "bolso-furado",
      "time" => Time.now.to_i }
  end

  def modify_items!(items_to_tag)
    client.modify(items_to_tag) if items_to_tag.size > 0
  end
end
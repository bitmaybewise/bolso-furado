require "date"
require "./lib/pocket_client"

class BolsoFurado
  def initialize(opts)
    @opts = opts
    @opts[:days] ||= 30
    @pocket = PocketClient.new(opts[:key], opts[:token])
  end
  
  def execute!
    build_result(@pocket.retrieve_untagged).tap(&method(:tag_items!))
  end

  private

  def build_result(items)
    days_ago = Date.today - @opts[:days]
    OpenStruct.new(all: items,
                   old_articles: items.select { |item| item[:added_at] <= days_ago }, 
                   new_articles: items.select { |item| item[:added_at] > days_ago })
  end

  def tag_items!(result)
    @pocket.tag_as_bolso_furado(result.old_articles)
  end
end

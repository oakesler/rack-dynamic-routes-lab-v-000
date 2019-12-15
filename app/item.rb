class Item
  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    
  resp = Rack::Response.new
  req = Rack::Request.new(env)
 
  if req.path.match(/items/)
    item_name = req.path.split("/items/").last #turn 
    item = Item.find{|s| s.name == item_name}
    #item_price = item.price
    resp.write item.price
  end
 
 
 
 
  if req.path=="/items"
     resp.write "You requested the songs"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end


 if req.path.match(/songs/)
 
      song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    end


Your application should only accept the /items/<ITEM NAME> route. Everything else should 404

If a user requests /items/<Item Name> it should return the price of that item
IF a user requests an item that you don't have, then return a 400 and an error message
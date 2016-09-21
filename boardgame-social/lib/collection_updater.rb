require 'bgg'
require 'pp'

module CollectionUpdater

  class << self
    def get_bgg_collection(user)
      # pp BggApi.methods
      collection = Bgg::Collection.new(BggApi.collection({username: user.bgg_username}))
      # bgg_collection = BggApi.collection({username: user.bgg_username})
      return collection.owned
    end

    def add_to_collection(user, collection)
      collection.each do |game|
        game_to_add = user.games.where(bgg_id:game.id).first_or_create({name: game.name, image: game.image, bgg_link: "http://boardgamegeek.com/boardgame/#{game.id}", description: get_description(game)})

      end
    end

    def get_description(game)
      sleep(0.25) # delay on API calls
      game_data = BggApi.thing({id: game.id})
      default = "No description available!"
      if game_data['item']
        description = game_data['item'][0]['description'][0]
        return description.nil? ? default : description
      end
    end
  end

end

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

    def sync_collection(user, collection)
      collection.each do |game|
        game_in_db = Game.where(bgg_id: game.id).first_or_create({name: game.name, image: game.image, bgg_link: "http://boardgamegeek.com/boardgame/#{game.id}", description: get_description(game)})

        if user.games.where(bgg_id: game.id).empty?
          user.games << game_in_db
        end
      end
    end

    def add_to_collection(user, game_data)
      return user.games.where(bgg_id: game_data['id']).first_or_create({name: game_data['name'][0]['value'], image: game_data['image'][0], bgg_link: "http://boardgamegeek.com/boardgame/#{game_data['id']}", description: game_data['description'][0]})
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

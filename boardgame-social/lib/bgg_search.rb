require 'bgg'
require 'pp'

module BggSearch

  class << self
    def search_bgg(search_term)
      result = Bgg::Search.query(search_term)
      if result.any?
        return boardgames = get_boardgames(result)
      end
      return []
    end

    private

    def get_boardgames(list)
      boardgame_list = list.select do |item|
        item.type == "boardgame"
      end
      return boardgame_list.map do |boardgame|
        game_data = BggApi.thing({id: boardgame.id})
        sleep(0.3)
        Game.new({
          description: game_data['item'][0]['description'][0],
          bgg_id: boardgame.id,
          name: boardgame.name,
          image: game_data['item'][0]['image'].nil? ? "http://slick-paris.com/wp-content/plugins/special-recent-posts/images/no-thumb.png" : game_data['item'][0]['image'][0],
          bgg_link:"http://boardgamegeek.com/boardgame/#{boardgame.id}"
        })
      end
    end
  end

end

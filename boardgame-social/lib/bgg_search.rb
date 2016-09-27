require 'bgg'
require 'pp'

module BggSearch

  class << self
    def search_bgg(search_term)
      result = Bgg::Search.query(search_term)
      if result.any?
        return get_boardgames(result)
      end
      return []
    end

    private

    def get_boardgames(list)
      boardgame_list = list.select do |item|
        item.type == "boardgame"
      end
      boardgame_ids = boardgame_list.map {|boardgame| boardgame.id}
      p boardgame_ids
      game_data = BggApi.thing({id: boardgame_ids.join(',')})
      pp game_data
      return game_data['item'].map do |boardgame|
        Game.new({
          description: boardgame['description'][0],
          bgg_id: boardgame['id'].to_i,
          name: boardgame['name'][0]['value'],
          image: boardgame['image'].nil? ? "http://slick-paris.com/wp-content/plugins/special-recent-posts/images/no-thumb.png" : boardgame['image'][0],
          bgg_link: "http://boardgamegeek.com/boardgame/#{boardgame['id']}"
        })
      end
    end
  end

end

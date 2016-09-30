class AddImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string, default: "http://slick-paris.com/wp-content/plugins/special-recent-posts/images/no-thumb.png"
  end
end

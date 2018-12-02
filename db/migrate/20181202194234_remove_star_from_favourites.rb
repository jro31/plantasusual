class RemoveStarFromFavourites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favourites, :star, :boolean
  end
end

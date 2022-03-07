class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.integer :rating
      t.string :original_language
      t.string :original_title
      t.string :poster_url
      t.string :backdrop_url
      t.date :release_date

      t.timestamps
    end
  end
end

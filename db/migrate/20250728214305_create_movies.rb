class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.string :director_name

      t.timestamps
    end
  end
end

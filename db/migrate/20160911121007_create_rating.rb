class CreateRating < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.integer :movie_id
      t.integer :user_id
    end
  end
end

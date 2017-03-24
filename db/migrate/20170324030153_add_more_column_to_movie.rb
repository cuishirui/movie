class AddMoreColumnToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :director, :string
    add_column :movies, :actor ,   :string
    add_column :movies, :movie_type, :string
    add_column :movies, :country,  :string
    add_column :movies, :language, :string
    add_column :movies, :show_time, :date
    add_column :movies, :film_length, :integer
  end
end

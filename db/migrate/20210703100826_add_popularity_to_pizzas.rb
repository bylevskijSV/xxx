class AddPopularityToPizzas < ActiveRecord::Migration[6.1]
  def change
    add_column :pizzas, :popularity, :integer
  end
end

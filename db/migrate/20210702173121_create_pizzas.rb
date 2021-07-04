class CreatePizzas < ActiveRecord::Migration[6.1]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.float  :price
      t.string :ingredients
      t.string :description
      t.float  :weight
      t.string :photo

      t.timestamps
    end
  end
end

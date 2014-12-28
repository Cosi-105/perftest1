class People < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :city
      t.integer :random
      t.string :country
    end
  end
end

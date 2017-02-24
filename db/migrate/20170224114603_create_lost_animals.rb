class CreateLostAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :lost_animals do |t|
      t.string :name
      t.string :owner
      t.string :owner_email
      t.text :description
      t.belongs_to :city, foreign_key: true

      t.timestamps
    end
  end
end

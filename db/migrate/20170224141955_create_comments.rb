class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.belongs_to :lost_animal, foreign_key: true

      t.timestamps
    end
  end
end

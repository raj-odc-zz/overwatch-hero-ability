class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.string :name
      t.text :description
      t.boolean :is_ultimate
      t.references :hero, index: true
      t.timestamps
    end
  end
end

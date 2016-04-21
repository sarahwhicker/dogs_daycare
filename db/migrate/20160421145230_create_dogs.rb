class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :string
      t.string :breed
      t.string :string
      t.string :age
      t.string :integer

      t.timestamps null: false
    end
  end
end

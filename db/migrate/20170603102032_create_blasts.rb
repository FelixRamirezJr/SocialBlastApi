class CreateBlasts < ActiveRecord::Migration[5.1]
  def change
    create_table :blasts do |t|
      t.text :name
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end

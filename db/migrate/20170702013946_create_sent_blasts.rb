class CreateSentBlasts < ActiveRecord::Migration[5.1]
  def change
    create_table :sent_blasts do |t|
      t.references :user, foreign_key: true
      t.text :message
      t.string :picture

      t.timestamps
    end
  end
end

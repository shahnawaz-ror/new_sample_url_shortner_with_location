class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :encoded_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

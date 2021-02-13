class CreateUrlShorts < ActiveRecord::Migration[5.2]
  def change
    create_table :url_shorts do |t|
      t.text :link

      t.timestamps
    end
  end
end

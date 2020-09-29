class CreateRequestUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :request_urls do |t|
      t.string :url, null: false
      t.datetime :requested_at
      t.datetime :crawled_at

      t.timestamps
    end

    add_index :request_urls, :url, unique: true
  end
end

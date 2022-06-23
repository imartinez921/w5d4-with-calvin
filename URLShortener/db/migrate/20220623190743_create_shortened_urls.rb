class CreateShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url, null: false
      #this is a foreign key to User
      t.integer :user_id, null: false
      
      t.timestamps
    end

    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :user_id
    add_index :shortened_urls, [:long_url, :short_url], unique: true

  end
end

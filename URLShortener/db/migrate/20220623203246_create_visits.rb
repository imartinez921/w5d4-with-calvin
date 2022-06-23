class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :visits, :user_id

  end
end

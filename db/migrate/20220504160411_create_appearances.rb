class CreateAppearances < ActiveRecord::Migration[6.1]
  def change
    create_table :appearances do |t|
      t.integer :episode_id
      t.integer :guest_id
      t.integer :rating
      t.timestamps
    end
  end
end

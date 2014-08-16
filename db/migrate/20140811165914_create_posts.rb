class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text     :content, :limit => nil
      t.integer  :user_id

      t.timestamps
    end
  end
end

class AddProfileToUsers < ActiveRecord::Migration
  def up
    add_column :users, :summary, :text
    add_column :users, :injury_year, :integer
    add_column :users, :rehab_level, :integer
    add_column :users, :gender, :boolean, :default => true
  end

  def down
    remove_column :users, :gender, :boolean
    remove_column :users, :rehab_level
    remove_column users, :injury_year
    remove_column :users, :summary
  end
end

class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :summary, :text
    add_column :users, :injury_year, :integer
    add_column :users, :rehab_level, :integer
    add_column :users, :gender, :boolean, :default => true
  end
end

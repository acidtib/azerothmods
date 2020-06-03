class AddDataToMods < ActiveRecord::Migration[5.2]
  def change
    add_column :mods, :author, :string
    add_column :mods, :description, :string
    add_column :mods, :watchers, :integer
    add_column :mods, :stars, :integer
    add_column :mods, :forks, :integer
    add_column :mods, :repo_updated_at, :datetime
    add_column :mods, :repo_created_at, :datetime
  end
end

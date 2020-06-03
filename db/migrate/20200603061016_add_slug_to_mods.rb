class AddSlugToMods < ActiveRecord::Migration[5.2]
  def change
    add_column :mods, :slug, :string
  end
end

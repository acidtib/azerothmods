class AddModAvatarToMods < ActiveRecord::Migration[5.2]
  def change
    add_column :mods, :mod_avatar, :string
  end
end

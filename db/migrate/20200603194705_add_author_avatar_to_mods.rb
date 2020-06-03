class AddAuthorAvatarToMods < ActiveRecord::Migration[5.2]
  def change
    add_column :mods, :author_avatar, :string
  end
end

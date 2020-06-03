class CreateReadmes < ActiveRecord::Migration[5.2]
  def change
    create_table :readmes do |t|
      t.references :mod, foreign_key: true
      t.text :content
      t.string :url
      t.string :encoding

      t.timestamps
    end
  end
end

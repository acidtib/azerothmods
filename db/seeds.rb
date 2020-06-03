# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

readMods = File.read("./config/modules.json")
mods = JSON.parse(readMods)

mods.each do |mod|
  findModule = Mod.find_by_name(mod["name"])
  
  unless findModule
    Mod.create(mod)
  end
end
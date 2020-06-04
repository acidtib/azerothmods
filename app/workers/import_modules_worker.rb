class ImportModulesWorker
  include Sidekiq::Worker

  def perform
    readMods = File.read(Rails.root.join('config', 'modules.json'))
    mods = JSON.parse(readMods)

    mods.each do |mod|
      findModule = Mod.find_by_name(mod["name"])
      
      if findModule
        findModule.update(mod)
      else
        newMod = Mod.create(mod)

        ScanModWorker.perform_in(30.second, newMod.id)
      end
    end
  end
end
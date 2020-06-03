class CheckModsWorker
  include Sidekiq::Worker

  def perform
    mods = Mod.all

    mods.each do |mod|
      ScanModWorker.perform_async(mod.id)
    end
  end
end
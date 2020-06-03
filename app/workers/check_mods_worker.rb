class CheckModsWorker
  include Sidekiq::Worker

  def perform
    mods = Mod.all

    mods.each do |mod|
      ScanModWorker.perform_in(30.second, mod.id)
    end
  end
end
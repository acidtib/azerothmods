class PageController < ApplicationController
  def home
    @mods = Mod.all.order('updated_at DESC')
  end
end

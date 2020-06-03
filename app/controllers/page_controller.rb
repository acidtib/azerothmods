class PageController < ApplicationController
  def home
    @mods = Mod.where(mod_type: "module").page(params[:page])
    if params["order"]
      @mods = @mods.order("#{params["order"]} DESC")
    else
      @mods = @mods.order('repo_updated_at DESC')
    end
  end

  def tools
    @mods = Mod.where(mod_type: "tool").page(params[:page])
    if params["order"]
      @mods = @mods.order("#{params["order"]} DESC")
    else
      @mods = @mods.order('repo_updated_at DESC')
    end
  end

  def lua
    @mods = Mod.where(mod_type: "lua-script").page(params[:page])
    if params["order"]
      @mods = @mods.order("#{params["order"]} DESC")
    else
      @mods = @mods.order('repo_updated_at DESC')
    end
  end

  def search
    @search = params["q"]
    @mods = Mod.where("name LIKE :search OR description LIKE :search", search: "%#{@search}%").page(params[:page])
  end
end

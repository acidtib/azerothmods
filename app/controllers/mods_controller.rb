class ModsController < ApplicationController
  before_action :set_mod, only: [:show]

  # GET /mods/slug
  # GET /mods/slug.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mod
      @mod = Mod.find_by_slug(params[:slug])
    end
end

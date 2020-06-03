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

    # Only allow a list of trusted parameters through.
    def mod_params
      params.require(:mod).permit(:name, :repo, :mod_type)
    end
end

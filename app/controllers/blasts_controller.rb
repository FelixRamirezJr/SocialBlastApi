class BlastsController < ApplicationController

  def update_blasts
    user = User.find(params[:id])
    user.blasts.update(active: false)
    list = params[:blast_list].split(params[:delimeter])
    user.blasts.where(name: list).update(active: true)
    render json: user.blasts.where(active: true)
  end

  def get_blast_list
    render json: User.find(params[:id]).blasts
  end

  def get_active_blast_list
    render json: User.find(params[:id]).blasts.where(active: true)
  end

  def toggle_active
    active = false
    active = true if params[:active] == "true"
    Blast.find(params[:id]).update_column(:active,active)
    return render json: "okay"
  end



end

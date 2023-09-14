class BandMembershipsController < ApplicationController
  before_action :find_band

  def new
    @band_membership = @band.band_memberships.build
  end

  def create
    @band_membership = @band.band_memberships.build(band_membership_params)
    if @band_membership.save
      redirect_to band_path(@band_membership.band)
    else
      render 'new'
    end
  end
  
  def destroy
   band_membership = BandMembership.find(params[:id])
   band_membership.destroy
   redirect_to band_path(band_membership.band)
  end
  
  private

  def band_membership_params
    params.require(:band_membership).permit(:user_id, :instrument)
  end

  def find_band
    @band = Band.find(params[:band_id])
  end
end

class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
  band = Band.new(band_params)
  if band.save
    # バンドが保存されたら、そのバンドのバンドメンバー入力画面にリダイレクト
    redirect_to new_band_band_membership_path(band)
  else
    render 'new'
  end
  end
  
  def destroy
     band = Band.find(params[:id])
     band.destroy
     redirect_to bands_path
  end

  def index
   @bands = Band.all
  end
  
  def show
   @band = Band.find(params[:id])
  end

  private

  def band_params
    params.require(:band).permit(:band_name, :song_name, :special_notes)
  end
end


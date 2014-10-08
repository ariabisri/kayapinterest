class GambarsController < ApplicationController
  def index
  	@gambar = Gambar.all
  end

  def new
  	@gambar=Gambar.new
  end

  def edit
  end

  def create
  	@gambar=Gambar.new(params_gambar)
  	if @gambar.save
      flash[:notice] = "Success add image"
  	 redirect_to action: 'index'
    else 
      flash[:error] = "Lengkapi Data"
      render 'new'
    end
end

private
def params_gambar
	params.require(:gambar).permit(:title, :lokasi)
end
end

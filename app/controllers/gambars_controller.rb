class GambarsController < ApplicationController
  def index
  	@gambar = Gambar.all
  end

  def new
  	@gambar=Gambar.new
  end

  def edit
    @gambar = Gambar.find_by_id(params[:id])
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

def update
  @gambar=Gambar.find_by_id(params[:id])
  if @gambar.update(params_gambar)
    flash[:notice]="success update"
    redirect_to action: 'index';
  else
    flash[:error] = "Lengkapi Data"
      render 'edit'
    end
  end

  def destroy
    @gambar=Gambar.find_by_id(params[:id])
    if @gambar.destroy
      @gambar.remove_lokasi
      flash[:notice]="success delete"
      redirect_to action: 'index';
    else
       flash[:error] = "fails delete a records"
    redirect_to action: 'index'
  end
end


private
def params_gambar
	params.require(:gambar).permit(:title, :lokasi)
end
end

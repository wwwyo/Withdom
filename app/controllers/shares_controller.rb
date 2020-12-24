class SharesController < ApplicationController
  # before_action :set_item, only: [:edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:index]

  def index
    @categories = Category.all
    @shares, @path_id = Share.check_path(params[:id], request.fullpath)
  end
  
  def new 
    @share = Share.new
  end

  def create
    @share = Share.create(share_params)
    if @share.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    @share.update(share_params)
  end

  def destroy
    @share.destroy
  end


  private
  def set_item
    @share = Share.find(params[:id])
  end

  def  share_params
    params.require(:share).permit(:share_url, :title, :comment, :category_id)
    .merge(user_id: current_user.id)
  end
end

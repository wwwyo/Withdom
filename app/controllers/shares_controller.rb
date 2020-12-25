class SharesController < ApplicationController
  before_action :set_share, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

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
    redirect_to root_path if current_user != @share.user
  end

  def update
    if @share.update(share_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user != @share.user || @share.destroy
      redirect_to root_path
    end
  end


  private
  def set_share
    @share = Share.find(params[:id])
  end

  def  share_params
    params.require(:share).permit(:share_url, :title, :comment, :category_id)
    .merge(user_id: current_user.id)
  end
end

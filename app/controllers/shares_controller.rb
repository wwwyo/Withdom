class SharesController < ApplicationController
  def index
    @categories = Category.all
    if params[:id]
      @shares = Share.includes(:user).where(category_id: params[:id]).order(created_at: :desc)
      @path_id = request.fullpath.split("/shares?id=").last
    else
      @shares = Share.includes(:user).order(created_at: :desc)
      @path_id = nil
    end
  end
  
  def new
  end

  def edit
  end
end

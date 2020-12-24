class SharesController < ApplicationController
  def index
    @categories = Category.all
    @shares, @path_id = Share.check_path(params[:id], request.fullpath)
  end
  
  def new
  end

  def edit
  end
end

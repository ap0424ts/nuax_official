class CollectionsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :destroy]

  def index
    @collections = Collection.all.order("created_at DESC")
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to collections_path
    else
      render :new
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to collections_path
  end


  private
  def collection_params
    params.require(:collection).permit(:season_id, images:[])
  end
end

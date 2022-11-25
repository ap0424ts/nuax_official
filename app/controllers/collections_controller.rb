class CollectionsController < ApplicationController

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


  private
  def collection_params
    params.require(:collection).permit(:season, images:[])
  end
end

class CollectionsController < ApplicationController
  def collection_params
    params.require(:collection).permit(:season, images:[])
  end
end

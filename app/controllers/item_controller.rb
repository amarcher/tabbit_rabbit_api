class ItemController < ApplicationController
  def create
    tab_id = params[:tab_id]
    item = params[:item]
    Item.new(item)
    if item.save
      render json: item
    end
  end
end

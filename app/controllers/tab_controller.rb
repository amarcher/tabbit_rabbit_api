class TabController < ApplicationController
  include Authenticatable

  def index
    tabs = current_user.tabs.sort_by(&:updated_at).reverse
    render json: tabs
  end

  def new
    tab = Tab.new(name: "Untitled Tab")
    tab.items << Item.create(price: 0)
    tab.user = current_user
    tab.rabbits << Rabbit.find(current_user.avatar_rabbit_id)
    tab.save!
    render json: tab
  end

  def edit
    tab_id = params[:id]
    tab = Tab.includes(:rabbits).includes(:items).find(tab_id)
    render json: tab
  end

  def update
    tab_id = params[:id]
    updated_items = params[:items]
    updated_tab = params[:tab]

    tab = Tab.includes(:items).find(tab_id)
    tab.update(name: updated_tab[:name])

    items = updated_items.map do |updated_item|
      updatedItem = updated_item.last
      item = Item.find(updated_item[:id])
      item.update(name: updated_item[:name], price: updated_item[:price])
      item
    end

    render json: { tab: tab, items: items }
  end
end

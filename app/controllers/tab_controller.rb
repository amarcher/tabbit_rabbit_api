class TabController < ApplicationController
  before_action :require_login

  def index
    @tabs = @user.tabs.sort_by(&:updated_at).reverse
    render json: @tabs # if request.xhr?
  end

  def new
    tab = Tab.new(name: "Untitled Tab")
    tab.items << Item.create(price: 0)
    tab.user = @user
    tab.rabbits << Rabbit.find(@user.avatar_rabbit_id)
    tab.save!
    render json: tab # if request.xhr?
    # redirect_to edit_tab_path(tab.id)
  end

  def edit
    tab_id = params[:id]
    @tab = Tab.includes(:rabbits).includes(:items).find(tab_id)
    render json: @tab
  end

  def update
    tab_id = params[:id]
    updatedItems = params[:items]
    updatedTab = params[:tab]

    @tab = Tab.includes(:items).find(tab_id)
    puts @tab.update(name: updatedTab[:name])

    @items = updatedItems.map do |updatedItem|
      updatedItem = updatedItem.last
      item = Item.find(updatedItem[:id])
      puts item.update(name: updatedItem[:name], price: updatedItem[:price])
      item
    end

    render json: { tab: @tab, items: @items }
  end

  def require_login
    # TODO: Actually authenticate a user
    @user = User.first
  end
end

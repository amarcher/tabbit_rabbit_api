class TabController < ApplicationController
  include Authenticatable

  def index
    tabs = current_user.tabs.sort_by(&:updated_at).reverse
    render json: tabs
  end

  def create
    tab = Tab.new(name: "Untitled Tab")
    tab.user = current_user
    tab.rabbit_ids = current_user.avatar_rabbit_id
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
    updated_tab = JSON.parse(params[:tab], symbolize_names: true)

    tab = Tab.find(tab_id)
    tab.update(updated_tab)

    render json: tab
  end
end

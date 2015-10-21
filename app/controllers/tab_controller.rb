class TabController < ApplicationController
  def index
    @tabs = Tab.all
  end
end

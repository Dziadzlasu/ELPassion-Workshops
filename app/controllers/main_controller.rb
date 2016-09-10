class MainController < ApplicationController
  def index
    @hello_world = "Witaj,  #{params[:name]} #{params[:lastname]}"
  end
end

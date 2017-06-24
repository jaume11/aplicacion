class StaticsController < ApplicationController
	skip_before_action :authenticate_user!
  def index
    if params[:search]
    	@peliculas = Pelicula.search(params[:search])
    elsif	params[:search_name]
      @peliculas = Pelicula.search_name(params[:search_name]).order('created_at DESC')
    elsif params[:search_year]
      @peliculas = Pelicula.search_year(params[:search_year])
    else
      @peliculas = Pelicula.all.order('created_at DESC')
    end
  end

  def show
    @pelicula = Pelicula.find(params[:id])
  end

  def about
  end
end

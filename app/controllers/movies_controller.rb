# app/controllers/movies_controller.rb  
class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  #rescue => err
    #puts err.message
    #flash[:warning]="La pelicula solicitada #{params[:id]} no existe"
    #redirect_to movies_path

  rescue ActiveRecord::RecordNotFound => err
    puts err.message
    puts "holaaaaaaaa"
    flash[:warning]="La pelicula solicitada #{params[:id]} no existe"
    redirect_to movies_path
  end

  def index
    @movies = Movie.find(:all, :order => "title")
    @title = "My RottenPotatoes"
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create(params[:movie])
    flash[:notice]="#{@movie.title} was succesfully created "
    redirect_to movie_path(@movie.id)
  end

  def edit
    @movie= Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice]="#{@movie.title} was succesfully created"
    redirect_to movies_path
  end

  def destroy
    @movie= Movie.find params[:id]
    @movie.destroy
    flash[:notice]="#{@movie.title} was succesfully deleted"
    redirect_to movies_path
  end
end

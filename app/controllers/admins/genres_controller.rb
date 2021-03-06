class Admins::GenresController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	  redirect_to admins_genres_path
  	else
  	  @genres = Genre.all
  	  render 'index', danger: 'ジャンルを選択してください'
  	end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
      if @genre.update(genre_params)
  	    redirect_to admins_genres_path
  	  else
  	    render 'edit', danger: 'ジャンルを選択してください'
  	  end
  end

    private
      def genre_params
        params.require(:genre).permit(:name, :is_invalid)
      end
end

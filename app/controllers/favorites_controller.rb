class FavoritesController < ApplicationController

  def create
   @favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
   @favorite.save
   redirect_to books_path

  end

  def destroy
    @favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to books_path
  end
end
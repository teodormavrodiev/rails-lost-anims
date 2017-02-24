class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @lost_animal = LostAnimal.find(params[:lost_animal_id])
    @comment.lost_animal = @lost_animal
    respond_to do |format|
      if @comment.save
        format.html { redirect_to city_lost_animal_path(params[:city_id], params[:lost_animal_id]), notice: 'Comment was successfully added.' }
      else
        format.html { redirect_to city_lost_animal_path(params[:city_id], params[:lost_animal_id]), notice: 'Your comment could not be added.' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end

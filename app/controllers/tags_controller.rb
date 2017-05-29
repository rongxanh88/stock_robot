class TagsController < ApplicationController

  def new
    @ticker = Ticker.find(params[:ticker_id])
    @tag = Tag.new
  end

  def create
    @ticker = Ticker.find(params[:ticker_id])
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:message] = "Tag(s) created!"
      redirect_to ticker_path(@ticker)
    else
      flash[:message] = "Tag Creation Unsuccessful"
      render :news
    end
  end

  def destroy
    # session.clear
    # flash[:message] = "Successfully logged out."
    # redirect_to "/home"
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end

end

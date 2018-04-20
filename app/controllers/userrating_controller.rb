class UserratingController < ApplicationController

  def articlerating

    @user_rating=Userrating.create(set_params)
    @user_rating.user_id=current_user.id
    @user_rating.article_id=params[:userrating][:article_id].to_i
    @user_rating.save!
    redirect_to root_path
  end

  private
    def set_params
      params.require(:userrating).permit(:user_rating,:article_id)
    end

end

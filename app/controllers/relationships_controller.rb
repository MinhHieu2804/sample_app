class RelationshipsController < ApplicationController
  before_action :logged_in?
  before_action :find_follow, only: :create
  before_action :find_followed, only: :destroy

  def create
    current_user.follow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def destroy
    current_user.unfollow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  private
  def find_follow
    @user = User.find_by id: params[:followed_id]
    return if @user

    flash[:danger] = t ".follow_failed"
    redirect_to root_path
  end

  def find_followed
    relation_ship = Relationship.find_by id: params[:id]
    @user = relation_ship.followed if relation_ship
    return if @user

    flash[:danger] = t ".unfollow_failed"
    redirect_to root_path
  end
end

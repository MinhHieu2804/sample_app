class MicropostsController < ApplicationController
  before_action :logged_in?, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params
    @micropost.image.attach params[:micropost][:image]
    if @micropost.save
      flash[:success] = t ".created"
      redirect_to root_url
    else
      @pagy, @feed_items = pagy current_user.feed
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t "microposts.deleted"
    else
      flash[:danger] = t "microposts.delete_fails"
    end
    redirect_to request.referer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    return if @micropost

    flash[:danger] = t "microposts.empty"
    redirect_to root_url if @micropost.nil?
  end
end

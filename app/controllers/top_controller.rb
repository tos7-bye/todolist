class TopController < ApplicationController
  before_action :blocking_edit_user, only: %i[edit update]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find_by(params[:id])
    # @lists = List.where(user: current_user).order("created_at ASC")
    @lists = @user.lists.order('created_at desc').page(params[:page]).per(10)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def blocking_edit_user
    redirect_to root_path, alert: "不正な操作です" unless (@user == current_user) || current_user.admin?
  end
end

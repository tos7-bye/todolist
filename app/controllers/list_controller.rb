class ListController < ApplicationController
  # サインインしていない状態でリストを作成できない
  before_action :authenticate_user!
  before_action :set_list, only: %i(edit update destroy)

  def index
    # N + 1対策
    @lists = List.limit(10).includes(:cards, :user).order('created_at DESC')
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
      flash[:notice] = "投稿が保存されました"
    else
      render action: :new
    end
  end
# paramsは最初に取得したレコードを返す
  def edit
    # @list = List.find_by(id: params[:id])
  end

  def update
    # @list = List.find_by(id: params[:id])
    if @list.update_attributes(list_params)
      # 成功時に更新と保存を行うメソッド
      redirect_to new_list_card_path(list)
    else
      render action: :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to controller: :top, action: :show
  end

  private
  # privateメソッドは外部から呼び出せない

  def list_params
    params.require(:list).permit(:title).merge(user_id: current_user.id)
  end

  # beforeで取得
  def set_list
    @list = List.find_by(id: params[:id])
  end
end

# paramsとは送られてきたリクエスト情報をひとまとめにしたものです。

# requireで受け取る値のキーを設定します。

# permitで変更を加えられるキーを指定します。今回の場合、titleを指定しています。

# mergeメソッドは2つのハッシュを統合するメソッドです。今回は誰がリストを作成したかという情報が必要なためuserの情報を統合しています。
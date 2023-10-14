class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # showとindexアクションをする前にログインしていなかったら、ログイン画面に戻る。
  before_action :move_to_index, only: [:edit ]
  # editアクションをする前だけ～。
  # showとindex以外はログインしないと処理出来ない。before_action :authenticate_user!だけだとログインページに戻る。
  def index
    @prototypes = Prototype.all
    # @prototypesは自分で作成OKだが分かりやすい用語。Prototype.allはモデルのPrototypeの情報を全て
    # @users = User.all
  end



  def new
  @prototype = Prototype.new
end

def create
@prototype = Prototype.new(prototype_params)
    if @prototype.save
  redirect_to '/'
else
  render :new, status: :unprocessable_entity
end
end

def show
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user)
  # 一つの投稿（@prototype）に全てのコメント（ユーザー情報）も @commentsに代入。includesでN+1問題クリア。
end
# createメソッドは登録、保存後でもredirect_toを実行してしまう。問題なくても。
# その為、saveメソッドはif条件分岐が出来る。
# createメソッドはパラムスを使う必要がある。
# status: :unprocessable_entit セットでエラー表示されても入力した情報は保存されるという意味。

def edit
  @prototype = Prototype.find(params[:id])
end

def update
   prototype = Prototype.find(params[:id])
   if prototype.update(prototype_params)
    redirect_to root_path
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
  redirect_to root_path
end

private
def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end

def move_to_index
  resource = Prototype.find(params[:id])
  # unless user_signed_in?
    unless resource.user_id == current_user.id
      # unless prototype.user.name_signed_in?
      # unless current.user_signed_in?
      # require_owner
    redirect_to action: :index
  end
end
end

# 2行目のbefore_action :move_to_index, only: [:edit ]のmove_to_index(これは何でもよりメソッド)
# resourceも何でもよいメソッド。
<<<<<<< Updated upstream
# ユーザーIDとログインしている人が同じでなかった場合は、トップページに戻る。
=======
# ユーザーIDとログインしている人が同じでなかった場合は、トップページに戻る。

# githubはまずはメイン状態で右のボタンを教えてから、コメント実装など作成する。
# 万が一、コメント実装などを作成してからの場合は、Default branchをmainに変える。（General)
# エラーが出た際は先にVCで修正してから、githubでrepoする。
>>>>>>> Stashed changes

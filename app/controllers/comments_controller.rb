class CommentsController < ApplicationController
	def create
		@prototype = Prototype.find(params[:prototype_id])
		# @room = Room.find(params[:room_id]) prototype idからデータを見つける。
		@comment = Comment.new(comment_params)
		@comments = @prototype.comments
    # コメントを保存するだけの為、上記と書き方が違う。
    if @comment.save
  redirect_to "/prototypes/#{@comment.prototype.id}"
else
  render :"prototypes/show", status: :unprocessable_entity
end
# commentsコントローラーだが、prototypesコントローラーのshowに行きたい際は、別ディレクトリの為"prototypes/show"と記載する。
# @prototype = Prototype.find(params[:prototype_id]) →DBevweのprorotypeモデルのIDを一つ抜く。
# @comment = Comment.new(comment_params)保存をしようとしたコメントをインスタンス変数として空箱を作り、@commentに入れた。comment_paramsがある為、user_idのcurrent_user.idと、prototype_idのparams[:prototype_id])も一緒に保存。params[:prototype_id]は上記の3行目の情報。Dvevweのcommentsモデルにもコメントと一緒に保存されている。
# 今回は保存しようとした情報をif～定義したい為、@commentは必要。
# @commentsはvieで定義する為に必要。他の人のコメントも合わして一覧で表示させる為。





	end
		private
		def comment_params
			params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
		end
		# biinding pry はエラーであろう場所のアクションの前に記述。
		# 今回はコメントを保存→保存されない為、createの後ろに記述。createに問題なければ、ターミナルは長文で続く。
		# 止まれば、create後に問題がある。
		# 1にはparamsを入れる。小さい波かっこの前にモデル名、波かっこの中にキーがある。
		# *キーはviewのフォーム箇所。入力欄。 <%= f.text_field :content,今回でいうと、contentがキー。
		# ストロングパラメーター（comment_params)の中身にcontentがあるか確認する。params.require がストロングパラメーター
		# permittの中身がcontentでなかった為、エラー。
		# params.require(:comment).permit(:content)→params.requireは指定するモデル。
		# permitはキー。vieのフォームを見る。

end

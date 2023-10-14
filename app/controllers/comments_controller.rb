class CommentsController < ApplicationController
	def create
		@prototype = Prototype.find(params[:prototype_id])
		# @room = Room.find(params[:room_id]) prototype idからデータを見つける。
		@comment = Comment.new(comment_params)
    # コメントを保存するだけの為、上記と書き方が違う。
    if @comment.save
  redirect_to "/prototypes/#{@comment.prototype.id}"
else
  render :"prototypes/show", status: :unprocessable_entity
end



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

end

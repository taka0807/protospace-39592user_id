class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
    @prototypes = @user.prototypes
		# クリックされたUserモデルのデータを全て@userに入れる。
		# @をつけることにより、viewでも使える。@がないとローカル変数となり、ここでしか使えない。
		# @userを使うことにより、@user.nameでクリックしたユーザーの名前を表示する。
		# @user.profileであれば、プロフィールを表示する。
		# @prototypes = @user.prototypesは、viewで使用する場合、@prototypesで明示した方が短いので、これは記載した方がよい。
		# その為、カリキュラムの下記はなくても良い。
		# @nickname = user.nickname
    # @tweets = user.tweets
	end
end

Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy  ]
  resources :prototype do
    resources :comments, only: :create
  end
  resources :users, only: :show
  # ネスト内に入れない。入れるとprototypeがないとuserが作れないとなってしまう。
  # ユーザーは第三者の為、何もなくても作成できる。
  # rails routesでIDは特定のものを指定する際にある。指定がない例えばindexやcreateにはIDはない。
end

# deviceは新規登録、削除、ログイン機能しかない。
# 更新や編集、新規投稿の機能はない為、自分で実装する必要がある。
# モデルを作成する。
# モデル別に必要なアクションを設定する。newは新規投稿。
# ↓は説明だけ。
# resources :rooms, only: [:new, :create] do
#   resources :messages, only: [:index, :create]
# end
# do はネスタ。
# roomの中のメッセージという意味にする。
# メッセージはルームに入ってからでないと打てない。
# doの下は前半少し空ける。
# 上記の関係になると、URLも/rooms/:room_id/messages になり、roomの中のとmesssageとなる。
# 本来は/rooms/:room_id/はない。
# サイドバーのチャットルーム名に、 <%= link_to room.name, room_messages_path(room) %>とリンクを設定します。

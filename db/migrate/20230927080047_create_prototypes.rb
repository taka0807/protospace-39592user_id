class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :title
      t.text :catch_copy
      t.text :concept
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

# モデルでエラーが出ると、モデルファイルかマイグレーションファイルのどちらか。
# ～ attid と出たら、マイグレーション。
# マイグレーションを修正後はrollback
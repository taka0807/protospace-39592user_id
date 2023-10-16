class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :title,             null: false
      t.text :catch_copy,          null: false
      t.text :concept,             null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

# モデルでエラーが出ると、モデルファイルかマイグレーションファイルのどちらか。
# ～ attid と出たら、マイグレーション。
# マイグレーションを修正後はrollback
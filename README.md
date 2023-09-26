# README

<!-- usersテーブル -->
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|email               | string     | null: false  |
|encrypted_password  | string     | null: false  |
|name                | string     | null: false  |
|occupation          | text       | null:false   |
|position            | text       | null:false   |

prototypesテーブル
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|title               | text       | null: false  |
|catch               | text       | null: false  |
|concept             | text       | null: false  |
|user                | references | null:false   |
|position            | text       | null:false   |


<!-- commentsテーブル -->
| Column             | Type        | Options      |
| -------------------| ----------- | ------------ |
|content             | text        | null: false  |
|prototype           | text        | null: false  |
|user                | references  | null: false  |

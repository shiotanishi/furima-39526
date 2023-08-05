# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| nick_name          | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_kana         | string | null: false              |
| last_kana          | string | null: false              |
| birthday           | date   | null: false              |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                | Type     | Options     |
| ----------------------| ------   | -----------                    |
| item_name             | string   | null: false                    |
| info                  | text     | null: false                    |
| price                 | integer  | null: false                    |
| category_id           | integer  | null: false                    |
| condition_id          | integer  | null: false                    |
| shipping_fee_id       | integer  | null: false                    |
| prefecture_id         | integer  | null: false                    |
| scheduled_delivery_id | integer  | null: false                    |
| user                  |references| foreign_key: true ,null: false |


### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               |references  | foreign_key: true ,null: false |
| item               |references  | foreign_key: true ,null: false |



### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| post_code          | string     | null: false       |
| prefecture_id      | integer    | null: false       |
| municipality       | string     | null: false       |
| address            | string     | null: false       |
| building_name      | string     |                   |
| telephone_number   | string     | null: false       |
| purchase           |references  | foreign_key: true ,null: false |


## Association


- has_many :purchase




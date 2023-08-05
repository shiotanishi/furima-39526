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
- has_many :purchase


## items テーブル

| Column                | Type     | Options     |
| ----------------------| ------   | -----------                    |
| item_name             | string   | null: false                    |
| info                  | text     | null: false                    |
| price                 | string   | null: false                    |
| category_id           | string   | null: false                    |
| condition_id          | string   | null: false                    |
| shipping_fee_id       | string   | null: false                    |
| prefecture_id         | string   | null: false                    |
| scheduled_delivery_id | date     | null: false                    |
| user_id               |references| foreign_key: true ,null: false |


### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user_id            |references| foreign_key: true ,null: false |
| item_id            |references| foreign_key: true ,null: false |



### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| post_code          | string     | null: false       |
| prefectures_id     | string     | null: false       |
| municipality       | integer    | null: false       |
| address            | integer    | null: false       |
| building_name      | string     |                   |
| telephone_number   | string     | null: false       |
| user_id            |references| foreign_key: true ,null: false |


## Association


- has_many :purchase




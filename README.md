# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| nick_name          | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first-kana         | string | null: false              |
| last-kana          | string | null: false              |
| birthday           | date   | null: false              |



### Association

- has_many :items
- has_one :addresses


## items テーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| item_name             | string | null: false |
| info                  | text   | null: false |
| price                 | string | null: false |
| category_id           | string | null: false |
| condition_id          | string | null: false |
| brand_id              | string | null: false |
| shipping-fee_id       | string | null: false |
| prefecture_id         | string | null: false |
| scheduled-delivery_id | date   | null: false |
| user_id               | integer| null: false |


### Association

- belongs_to :users
- has_one :purchase


## purchase テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user_id            | integer       | null: false       |
| price              | integer    | foreign_key: true |
| category           | integer    | foreign_key: true |
| condition          | integer    | foreign_key: true |
| delivery_charge    | integer    | null: false       |
| sender             | integer    | null: false       |
| estimated_delivery | integer    | null: false       |
| comment            | text       | null: false       |




### Association

- belongs_to :item
- belongs_to :user



## addresses テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| post_code          | string     | null: false       |
| prefectures        | integer    | foreign_key: true |
| municipality       | integer    | foreign_key: true |
| address            | integer    | foreign_key: true |
| building_name      | string     | null: false       |
| telephone_number   | string     | null: false       |
| user_id            | integer    | null: false       |


## Association

- belongs_to :user
- has_many :purchase




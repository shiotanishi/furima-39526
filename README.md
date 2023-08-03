# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false,|
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last-name          | string | null: false |
| birthday           | string | null: false |
| favorite           | string | null: false |



### Association

- has_many :users
- has_many :rooms,through: :exhibit
- has_many :purchase


## exhibit テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              | string | null: false |
| item_name          | string | null: false |
| info               | string | null: false |
| price              | string | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| brand              | string | null: false |
| shipping fee       | string | null: false |
| prefecture         | string | null: false |
| scheduled delivery | string | null: false |



### Association

- has_many :users
- has_many :rooms,through: :exhibit
- has_one :purchase


## purchase テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| seller             | references | foreign_key: true |
| price              | references | foreign_key: true |
| category           | references | foreign_key: true |
| condition          | references | foreign_key: true |
| delivery_charge    | string     | null: false       |
| sender             | string     | null: false       |
| estimated_delivery | string     | null: false       |
| favorite           | references | foreign_key: true |



### Association

- belongs_to :exhibit
- belongs_to :user


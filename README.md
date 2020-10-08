# README


## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :item


## items テーブル

| Column           | Type   | Options     |
| ------           | ------ | ----------- |
| item_name        | string | null: false |
| price            | string | null: false |
| item_description | string | null: false |
| image            | text   |
| user_id          | string | null: false |


### Association

- belongs_to :user

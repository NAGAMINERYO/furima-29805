# README


## users テーブル

| Column                | Type    | Options     |
| --------              | ------  | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_furigana  | string  | null: false |
| first_name_furigana   | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_one :sales




## items テーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| name               | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| shipment_source_id | integer    | null: false |
| Shipping day_id    | integer    | null: false |
| price              | integer    | null: false | 
| user_id            | references | null: false |


### Association

- belongs_to :user
- has_many :sales



## shipping_addresses テーブル
| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| postal_code      | integer    | null: false |
| prefectures      | integer    | null: false |
| municipality     | string     | null: false |
| address          | string     | null: false |
| building         | string     |
| shipment_source  | string     | null: false |
| phone number     | string     | null: false |
| sale_id          | references | null: false |

### Association
- belongs_to :sale


## sales テーブル
| Column   | Type    | Options     |
| ------   | ------  | ----------- |
| item_id  | integer | null: false |
| user_id  | integer | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address
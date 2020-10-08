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

- has_many :item
- has_many :sales
- has_many :shipping_address



## items テーブル

| Column           | Type    | Options     |
| ------           | ------  | ----------- |
| name             | string  | null: false |
| description      | text    | null: false |
| category         | integer | null: false |
| status           | integer | null: false |
| delivery_charge  | integer | null: false |
| shipment_source  | integer | null: false |
| Shipping days    | integer | null: false |
| price            | integer | null: false | 

### Association

- belongs_to :user



## shipping_addresses テーブル
| Column           | Type    | Options     |
| ------           | ------  | ----------- |
| postal_code      | string  | null: false |
| prefectures      | string  | null: false |
| municipality     | string  | null: false |
| address          | string  | null: false |
| building         | string  |
| shipment_source  | string  | null: false |
| phone number     | string  | null: false |

### Association
- belongs_to :user




## sales テーブル
| Column   | Type    | Options     |
| ------   | ------  | ----------- |
| item_id  | integer | null: false |
| user_id  | integer | null: false |

### Association
- belongs_to :user
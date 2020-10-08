# README


## users テーブル

| Column                | Type    | Options     |
| --------              | ------  | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| birthday              | integer | null: false |

### Association

- has_many :item
- has_many :sales
- has_many :shipping_address



## items テーブル

| Column           | Type    | Options     |
| ------           | ------  | ----------- |
| name             | string  | null: false |
| description      | text    | null: false |
| category         | string  | null: false |
| status           | string  | null: false |
| delivery_charge  | integer | null: false |
| shipment_source  | string  | null: false |
| Shipping days    | integer | null: false |
| price            | integer | null: false | 

### Association

- belongs_to :user



## shipping_addresses テーブル
| Column           | Type    | Options     |
| ------           | ------  | ----------- |
| postal code      | integer | null: false |
| prefectures      | string  | null: false |
| municipality     | string  | null: false |
| address          | integer | null: false |
| building         | integer |
| shipment_source  | string  | null: false |
| phone number     | integer | null: false |

### Association
- belongs_to :user




## sales テーブル
| Column   | Type    | Options     |
| ------   | ------  | ----------- |
| sales_id | integer | null: false |
| user_id  | integer | null: false |

### Association
- belongs_to :user
# FurimaのER図

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| password           | string  | null: false |
| nickname           | string  | null: false |
| first_name         | string  | null: false |
| family_name        | string  | null: false |
| first_name_kana    | string  | null: false |
| family_name_kana   | string  | null: false |
| year               | integer | null: false |
| month              | integer | null: false |
| day                | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            |Type        | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| text              | text       | null: false                    |
| category          | string     | null: false                    |
| condition         | text       | null: false                    |
| shipping_cost     | integer    | null: false                    |
| sender            | string     | null: false                    |
| shipping_date     | integer    | null: false                    |
| price             | integer    | null: false                    | 
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :ship

## ships テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| order         | reference  | null: false, foreign_key: true |

### Association

- belongs_to :order
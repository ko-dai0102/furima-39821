# テーブル設計

## Users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| first_name         | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name_kana    | string     | null: false               |
| birthdate          | date       | null: false               |

### Association

- has_many :items
- has_many :records

## Items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| info          | text       | null: false                    |
| status_id     | integer    | null: false                    |
| charge_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| schedule_id   | integer    | null: false                    |
| price         | string     | null: false                    |
| category_id   | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :images
- belongs_to :category
- has_one :record

## Addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| record_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :record

## Records テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## Images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## Categories テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| name_id | integer | null: false |

### Association

- has_many :items
# テーブル設計

## usersテーブル
| Column             | Type    | Option                    |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| ruby_last_name     | string  | null: false               |
| ruby_first_name    | string  | null: false               |
| birth_date         | integer | null: false               |

## Association
- has_one :address
- has_many :items


## addressesテーブル
| Column              | Type       | Option                         |
|---------------------|------------|--------------------------------|
| postal_code         | integer    | null: false                    |
| province            | string     | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building            | string     |                                |
| phone_number        | integer    | null: false                    |
| user                | referenges | null: false, foreign_key: true |

## Association
- belongs_to : user

## itemsテーブル
| Column              | Type       | Option                         |
|---------------------|------------|--------------------------------|
| name                | string     | null: false                    |
| information         | text       | null: false                    |
| category            | string     | null: false                    |
| state               | string     | null: false                    |
| delivery_fee        | string     | null: false                    |
| delivery_time       | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

## Association
- belongs_to :user
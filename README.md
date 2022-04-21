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
| birth_date         | date    | null: false               |

## Association
- has_many : buying_histories
- has_many :items

## buying_historiesテーブル
| Column       | Type       | Option                         |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

## Association
- has_one :address
- belongs_to :user


## addressesテーブル
| Column              | Type       | Option                         |
|---------------------|------------|--------------------------------|
| postal_code         | string     | null: false                    |
| province_id         | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building            | string     |                                |
| phone_number        | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

## Association
- belongs_to : buying_history

## itemsテーブル
| Column              | Type       | Option                         |
|---------------------|------------|--------------------------------|
| name                | string     | null: false                    |
| information         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| state_id            | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| province_id         | integer    | null: false                    |
| delivery_time_id    | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

## Association
- belongs_to :user
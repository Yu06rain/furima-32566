# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | data   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| name              | string     | null: false |
| description       | text       | null: false |
| category_id       | integer    | null: false |
| condition_id      | integer    | null: false |
| postage_id        | integer    | null: false |
| region_id         | integer    | null: false |
| shipping_data_id  | integer    | null: false |
| price             | string     | null: false |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
- has_one_attached :image

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :residence

## residences テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| region_id     | integer    | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     |
| phone_number  | string     | null: false |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
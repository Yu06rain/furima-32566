# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| name              | string     | null: false |
| description       | text       | null: false |
| category_id       | string     | null: false |
| condition_id      | string     | null: false |
| postage_id        | string     | null: false |
| region_id         | string     | null: false |
| shipping_data_id  | string     | null: false |
| price             | string     | null: false |
| image             | string     | null: false |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
- has_one_attached :image

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase_price   | string     | null: false |
| card_information | string     | null: false |
| expiration_data  | string     | null: false |
| security_code    | string     | null: false |
| user             | references | null: false, foreign_key: true |
| items            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :residence

## residences テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefectures   | string     | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     | null: false |
| phone_number  | string     | null: false |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
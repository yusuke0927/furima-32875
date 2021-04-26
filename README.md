#テーブル設計

## usersテーブル

| Column                                 | Type        | Options       |
| ---------------------------------------| ----------- | ------------- |
| nick_name                              | string      | null: false   |
| email                                  | string      | unique: false, null: false |
| encrypted_password                     | string      | null: false   |
| name_chinese_character_last_name       | string      | null: false   |
| name_chinese_character_first_name      | string      | null: false   |
| name_catakana_last_name                | string      | null: false   |
| name_catanaka_first_name               | string      | null: false   |
| birthday                               | date        | null: false   |

### Association

- has_many :furimas
- has_many :purchases

##  furimasテーブル

| Column                       | Type         | Options                         |
| ---------------------------- | ------------ | ------------------------------- |
| furima_name                  | string       | null: false                     |
| description                  | text         | null: false                     |
| category_id                     | integer       | null: false                     |
| status_id                       | integer       | null: false                     |
| delivery_charge_id              | integer       | null: false                     |
| area_id                      | integer      | null: false                     |
| days_id                         | integer       | null: false                     |
| prise                        | integer       | null: false                     |
| user                         | references   | null: false, foreigin_key: true |

### Association
- has_many :users
- has_many :credit_cards


## credit_cardsテーブル

| Column                    | Type            | Options                        |
| ------------------------- | --------------- | ------------------------------ |
| information               | string          | null: false                    |
| expiration                | string          | null: false                    |
| security                  | string          | null: false                    |
| postal                    | string          | null: false                    |
| prefectures_id               | integer          | null: false                    |
| municipality              | string          | null: false                    |
| address                   | string          | null: false                    |
| building_name             |                 |                           |
| phone_number              | string          | null: false                    |
| user                      | references      | null: false, foreign_key: user |
| furima                    | references      | null: false, foreign_key: furima |

### Association
belongs_to :users
belongs_to :furimas



## purchaseテーブル

| Colum                     | Type             | Options                        |
| ------------------------- | ---------------- | ------------------------------ |
| user                      | references       | null: false, foreign_key: true |
| furima                    | references       | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :furima
- belongs_to :credit_cards
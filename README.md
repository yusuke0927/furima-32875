#テーブル設計

## usersテーブル

| Column                                 | Type        | Options       |
| ---------------------------------------| ----------- | ------------- |
| nick_name                              | string      | null: false   |
| email                                  | string      | unique: false |
| encrypted_password                     | string      | null: false   |
| name_chinese_character_last_name       | string      | null: false   |
| name_chinese_character_first_name      | string      | null: false   |
| name_catakana_last_name                | string      | null: false   |
| name_catanaka_first_name               | string      | null: false   |
| birthday                               | date        | null: false   |

### Association

- has_many :furimas
- has_many :credit_cards, through: furimas
- has_many :credit_cards


##  furimasテーブル

| Column                       | Type         | Options                         |
| ---------------------------- | ------------ | ------------------------------- |
| furima_name                  | string       | null: false                     |
| description                  | text         | null: false                     |
| category                     | string       | null: false                     |
| status                       | string       | null: false                     |
| delivery_charge              | string       | null: false                     |
| area_id                      | integer      | null: false                     |
| days                         | string       | null: false                     |
| prise                        | string       | null: false                     |
| user                         | references   | null: false, foreigin_key: true |

### Association
- belongs_to :user
- has_many   :users
- has_many   :credit_cards
- has_many   :users, through: credit_cards


## credit_cardsテーブル

| Column                    | Type            | Options                        |
| ------------------------- | --------------- | ------------------------------ |
| information               | string          | null: false                    |
| expiration                | string          | null: false                    |
| security                  | string          | null: false                    |
| postal                    | string          | null: false                    |
| prefectures               | string          | null: false                    |
| municipality              | string          | null: false                    |
| address                   | string          | null: false                    |
| building_name             |                 | null:                          |
| phone_number              | string          | null: false                    |
| user                      | references      | null: false, foreign_key: true |
| furima                    | references      | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :furima
- has_many   :users
- has_many   :furimas
- has_many   :users, through: furimas


##  addressテーブル

| Colum                     | Type             | Options                        |
| ------------------------- | ---------------- | ------------------------------ |
| user                      | references       | null: false, foreign_key: true |
| credit_card               | references       | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :furima


## purchaseテーブル

| Colum                     | Type             | Options                        |
| ------------------------- | ---------------- | ------------------------------ |
| user                      | references       | null: false, foreign_key: true |
| furima                    | references       | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :furima
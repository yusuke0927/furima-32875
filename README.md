#テーブル設計

## usersテーブル

| Column                                 | Type        | Options                    |
| ---------------------------------------| ----------- | -------------------------- |
| nick_name                              | string      | null: false                |
| email                                  | string      | null: false, unique: true  |
| encrypted_password                     | string      | null: false                |
| name_chinese_character_last_name       | string      | null: false                |
| name_chinese_character_first_name      | string      | null: false                |
| name_catakana_last_name                | string      | null: false                |
| name_catanaka_first_name               | string      | null: false                |
| birthday                               | date        | null: false                |

### Association

- has_many :furimas
- has_many :purchases

##  furimasテーブル

| Column                       | Type         | Options                         |
| ---------------------------- | ------------ | ------------------------------- |
| furima_name                  | string       | null: false                     |
| description                  | text         | null: false                     |
| category_id                  | integer      | null: false                     |
| status_id                    | integer      | null: false                     |
| delivery_charge_id           | integer      | null: false                     |
| area_id                      | integer      | null: false                     |
| day_id                       | integer      | null: false                     |
| price                        | integer      | null: false                     |
| user                         | references   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one    :purchase


## street_addressesテーブル

| Column                    | Type            | Options                          |
| ------------------------- | --------------- | -------------------------------- |
| postal                    | string          | null: false                      |
| area_id                   | integer         | null: false                      |
| municipality              | string          | null: false                      |
| address                   | string          | null: false                      |
| building_name             | string          |                                  |
| phone_number              | string          | null: false                      |
| purchase                  | references      | null: false, foreign_key: true   |
### Association
belongs_to :purchase



## purchasesテーブル

| Colum                     | Type             | Options                        |
| ------------------------- | ---------------- | ------------------------------ |
| user                      | references       | null: false, foreign_key: true |
| furima                    | references       | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :furima
- has_one    :street_address
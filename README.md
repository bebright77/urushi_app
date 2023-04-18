# テーブル設計

##　users_table
| column             | type    | options                   | 
| ------------------ | ------- | ------------------------- | 
| last_name_kanji    | string  | null: false               | 
| first_name_kanji   | string  | null: false               | 
| last_name_kana     | string  | null: false               | 
| first_name_kana    | string  | null: false               |
| email              | string  | null: false, unique: true | 
| encrypted_password | string  | null: false               |

### Association
- has_many :items
- has_many :orders
- has_many :favorites

# items_table
| cloumn            | type        | option                          |
| ----------------- | ----------  |-------------------------------- |
| item_name         | string      |  null: false                    |
| concept           | text        |  null: false                    |
| material          | text        |  null: false
| category_id       | integer     |  null: false                    |
| price             | integer     |  null: false                    | 
| user              | references  |  null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :order


# order_table
| cloumn         |  type      | option                         |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

# addresses_table
| cloumn          | type       | option                          | 
| --------------- | ---------- | ------------------------------- | 
| postal_code     | string     |  null: false                    |
| prefectures_id  | integer    |  null: false                    |
| municipality    | string     |  null: false                    |
| address         | string     |  null: false                    |
| building        | string     |                                 |
| phone_number    | string     |  null: false                    | 
| order           | references |  null: false, foreign_key: true |

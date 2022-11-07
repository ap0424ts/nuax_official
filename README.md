# テーブル設計

## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| last_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |

### Association
- has_one    :shipping, dependent: :destroy
- has_many   :orders

## adminsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| admin               | boolen     | default: false                 || 

### Association
- has_many   :orders
- has_many   :items

## itemsテーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| name           | string     | null: false                     |
| content        | text       |                                 |
| material       | string     | null: false                     |
| centimeter     | text       | null: false                     |
| price          | integer    | null: false                     |
| reservation_id | integer    | null: false                     |
| size_id        | integer    | null: false                     |

### Association
- has_many   :item_orders
- has_many   :orders, through: :item_orders
- has_many   :cart_items, dependent: :destroy
- belongs_to :size
- belongs_to :reservation
- belongs_to :admin
- has_many_atached : images


## cartsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |

### Association
- has_many :cart_items, dependent: :destroy

## cart_itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| cart_id    | references | null: false, foreign_key: true |
| quantity   | integer    | null:false                     |

### Association
- belongs_to :item
- belongs_to :cart

## item_ordersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item_id  | references | null: false, foreign_key: true |
| order_id | references | null: false, foreign_key: true |
| quantity | integer    | null: false                    |

### Association
- belongs_to :item
- belongs_to :order


## ordersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| shippings_id | references | null: false, foreign_key: true |
| quantity     | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :shipping
- has_many   :item_orders, dependent: :destroy
- has_many   :items, through: :item_orders

## shippingsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| state           | string     | null: false                    |
| city            | string     | null: false                    |
| addres          | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| order_id        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

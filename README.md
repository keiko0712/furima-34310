# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# データベース設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false ,unique: true  |
| encrypted_password | string | null: false                |
| family_name        | string | null: false                |
| first_name         | string | null: false                |
| family_name_ruby   | string | null: false                |
| first_name_ruby    | string | null: false                |
| birthday           | date   | null: false                |

 Association

- has_many : products
- has_many : purchase_records

## products テーブル

| Column                     | Type       | Options                          |
| -------------------------- | -----------| -------------------------------- |
| name                       | string     | null: false                      |
| description_of_product     | text       | null: false                      |
| price                      | integer     | null: false                      |
| user                       | references | null: false, foreign_key: true   |
| category_id                | integer    | null: false                      |
| product_status_id          | integer    | null: false                      |
| delivery_charge_id         | integer    | null: false                      |
| shipping_area_id           | integer    | null: false                      |
| estimated_shipping_date_id | integer    | null: false                      |

Association

- belongs_to : users
- has_one    : purchase_records

## purchase_records　テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

Association

- belongs_to : users
- belongs_to : products
- has_one    : shipping_addresses


## shipping_addresses テーブル
　
| Column           | Type       | Options                            |
| ---------------- | ---------- | ---------------------------------- |
| postal_code      | string     | null: false                        |
| shipping_area_id | integer    | null: false                        |
| municipality     | string     | null: false                        |
| address          | string     | null: false                        |
| building_name    | string     |                                    |
| phone_number     | string     | null: false                        |
| purchase_record  | references | null: false, foreign_key: true     |

Association

- belongs_to : purchase_records　

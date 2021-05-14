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
| family_name(ruby) | string | null: false                |
| first_name(ruby)  | string | null: false                |
| birthday           | date   | null: false                |

 Association

- has_many : products
- has_many : purchase_records

## products テーブル

| Column                  | Type       | Options                          |
| ----------------------- | -----------| -------------------------------- |
| product_name            | string     | null: false                      |
| description of product  | text       | null: false                      |
| user                    | references | null: false, foreign_key: true   |
| category                | string     | null: false                      |
| product_status          | integer    | null: false                      |
| delivery_charge         | integer    | null: false                      |
| shipping_area_id        | integer    | null: false                      |
| estimated_shipping_date | integer    | null: false                      |

Association

- belongs_to : user
- has_one    : purchase_record

## purchase_record　テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

Association

- belongs_to : user
- belongs_to : product
- has_one    : shipping_address


## shipping_address テーブル
　
| Column           | Type       | Options                            |
| ---------------- | ---------- | ---------------------------------- |
| postal_code      | string     | null: false                        |
| shipping_area_id | string     | null: false                        |
| municipality     | string     | null: false                        |
| address          | string     | null: false                        |
| building_name    | string     |                                    |
| phone_number     | string     | null: false                        |
| purchase_record  | references | null: false, foreign_key: true     |

Association

- belongs_to : purchase_record　

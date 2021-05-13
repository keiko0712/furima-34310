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

| Column        | Type   | Options      |
| ------------- | ------ | ------------ |
| nickname      | string | null: false  |
| email         | string | unique: true |
| password      | string | null: false  |
| name          | string | null: false  |
| ruby          | string | null: false  | 
| date of birth | string | null: false  |

 Association

- has_many : product
- has_many : purchase_record

## product テーブル

| Column                  | Type       | Options                          |
| ----------------------- | -----------| -------------------------------- |
| product image           | string     | null: false                      |
| product name            | string     | null: false                      |
| description of product  | string     | null: false                      |
| seller                  | references | null: false, foreign_key: true   |
| category                | string     | null: false                      |
| product status          | string     | null: false                      |
| delivery charge         | string     | null: false                      |
| shipping area           | string     | null: false                      |
| estimated shipping date | string     | null: false                      |

Association

- belongs_to : user
- has_one    : purchase_record

## purchase_record　テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buyer          | references | null: false, foreign_key: true |
| purchased item | references | null: false, foreign_key: true |

Association

- belongs_to : user
- has_one    : product
- has_one    : shipping_address


## shipping_address テーブル
　
| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal code   | string | null: false |
| prefectures   | string | null: false |
| municipality  | string | null: false |
| address       | string | null: false |
| building name | string |             |
| phone number  | string | null: false |

Association

- has_one    : purchase_record　

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

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------  | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| lase_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birthday           | date    | null: false              |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | -----------------------------  |
| user        | references | null: false, foreign_key: true |
| name        | string     | null: false                    |
| content     | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| cost_id     | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| price       | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :cost
- belongs_to :area
- belongs_to :day
- has_one :buy

## buys テーブル

| Column     | Type       | Options                        |
| -----------| ------     | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -----------------------------  |
| buy       | references | null: false, foreign_key: true |
| postcode  | string     | null: false                    |
| area_id   | integer    | null: false                    |
| city      | string     | null: false                    |
| address   | string     | null: false                    |
| building  | string     |                                |
| telephone | string     | null: false                    |


### Association

- belongs_to :buy
- belongs_to :area

# ActiveHash

## category

### Association
- has_many :items

## status

### Association
- has_many :items

## cost

### Association
- has_many :items

## day

### Association
- has_many :items

## area

### Association
- has_many :items
- has_many :deliveries
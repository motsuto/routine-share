# README

![routine-share](https://routine-share.herokuapp.com)

<h1 align="center">routine-share</h1>

<h2> Overview </h2>

<p> This app allows you to share your routine with a lot of people and keep them motivated and habit-built. </p>



<p align="center">
  <img src="https://gyazo.com/441283a478466f92c83606298df36e51" width=40%>
</p>

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :tweets
- has_many :groups_users
- has_many  :groups, through:  :groups_users

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
### Association
- has_many :tweets
- has_many :groups_users
- has_many  :users,  through:  :groups_users
- belongs_to :icon

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

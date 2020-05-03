# README

<h1 align="center">routine-share</h1>

<h2> 概要 </h2>

<p> ルーティンをみんなでシェアすることで、周りから刺激をもらい、習慣を身に着けることをお手伝いするアプリです。 </p>

<h2> 制作背景 </h2>

<p> コロナウイルスの影響で家にいる時間が長くなり、何もしないで一日が終わり気分が落ち込んでしまう人がいることを知りました。
そんな思いをしている人を少しでも減らすために、今日も一日やりきったと思え、かつその思いをみんなで共有できるアプリを製作しました。</p>



<h2> Production environment </h2>
  <p> https://routine-share.herokuapp.com </p>

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

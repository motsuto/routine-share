# README

<h1 align="center">routine-share</h1>

<h2> 概要 </h2>
<p> ルーティンをみんなでシェアすることで、周りから刺激をもらい、習慣を身に着けることをお手伝いするアプリです。 </p>

<h2> 開発環境 </>
<p> Ruby(2.5.1)/Ruby on Rails(5.0.7.2)/MySQL/Github/AWS/Visual Studio Code </p>

<h2> テストアカウント </h2>
<p> メールアドレス: test@gmail.com </p>
<p> パスワード: aaaaaaaa </p>

<h2> 本番環境 </h2>
<p> https://routine-share.herokuapp.com </p>
  
<h2> 機能（このアプリでできること） </h2>
<p> 今日行ったルーティンを文字や画像を使ってでツイートできます。また、グループ機能や、他の人のツイートを閲覧することができます。 </p>
<Ul>
  <li> ユーザー登録、編集、ログイン、ログアウト </li>
  <li> グループ作成、編集 </li>
  <li> 画像か文書、また両方記入した場合ツイート可能 </li>
  <li> ツイート閲覧 </li>
 </ul>

<h2> 制作背景 </h2>
<p> コロナウイルスの影響で家にいる時間が長くなり、何もしないで一日が終わり気分が落ち込んでしまう人がいることを知りました。　そんな思いをしている人を少しでも減らすために、今日も一日やりきったと思え、かつその思いをみんなで共有できるアプリを製作しました。</p>

![routineShare](https://github.com/motuto/routine-share/blob/master/app/assets/images/1dc89ae22ceb42c22f21d5a93bcccb87.png)

![routineShare](https://github.com/motuto/routine-share/blob/master/app/assets/images/d8aa5081cc67f46e52ab978cf17a0efb.png)

<p>↑グループ一覧</p>

![routineShare](https://github.com/motuto/routine-share/blob/master/app/assets/images/053c5bc41accbc55ded4b5eb067eff25.png)

<p>↑みんなのルーティンを見てやる気UP！</p>

<h2> 工夫したポイント </h2>
<p> 一週間という製作期間の中で、どれだけ使いやすいアプリにできるかを常に考えていたので、出来るだけシンプルな操作と見た目に心がけました。また、今までの学習のアウトプットと共に新しいことに挑戦しようと思い、前回アプリをEC2のサーバにデプロイしましたが、今回はHerokuを使用してデプロイを行いました。 </p>

<h2> 課題や今後について </h2>
<p> このアプリには、閲覧ページにはグループに限らず全てのツイートが表示され、ログインするたびに画像が表示されないと、まだまだ課題があります。今後はプログラミングスキルをさらに身につけ、自分の成長に繋げます。 </p>


## DB設計図

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
#### Association
- has_many :tweets
- has_many :groups_users
- has_many  :groups, through:  :groups_users

### tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
#### Association
- belongs_to :user
- belongs_to :group

### groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
#### Association
- has_many :tweets
- has_many :groups_users
- has_many  :users,  through:  :groups_users
- belongs_to :icon

### groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

#### Association
- belongs_to :group
- belongs_to :user

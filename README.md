## 1、アプリ名
檀家登録管理アプリ

## 2、概要
このアプリは、ユーザー管理機能を用いて檀家様の登録情報を檀家様ご自身だけでなく住職側もその情報を確認することができるアプリである。檀家様とは私が前職で勤めていた寺院の一般的には会員されているお客様のことであり、また、住職はその寺院の一般的には社長などの責任者のことを指す。このアプリの特徴としてはユーザー管理機能を複数のモデルに適用している。また、その他の機能として檀家様は寺院へ法事(お盆など)のためにいらっしゃるのでその予約管理機能やお墓の使用料をクレジットカードで支払うためのクレジットカード機能も導入する。

## 3、制作意図
私自身が前職で働いていた寺院では檀家様の登録情報を紙で管理しており、　なので、お墓の使用料を払っているかどうかや予約も全て電話、FAX、さらには態々足を運んでもらうかなどでアナログな対応であった。このことで、作業効率が悪く檀家様を待たせたり、ストレスを与えたりしてしまうことが多々あった。だが、パソコン1台とインターネットを使えば場所を選ばずにいつでもその業務ができるし人を使わなくて済む。このアプリが実現できたら相当檀家様のストレスが減るのではないかと思いこのアプリの実装を考えた。

## 4、実装予定
・お客様用(檀家さん)のユーザー登録・ログイン機能
・管理者用(お寺側)のユーザー登録・ログイン機能
・お客様用のユーザー詳細機能
・管理者用のユーザー詳細機能
・法事予約機能
・クレジットカード購入機能
・お客様用のユーザー編集削除機能
・管理者用のユーザー編集削除機能
・管理者用のお客様情報入力機能
・管理者用のお客様情報編集削除機能

## 5、DEMO　
今後実装予定

## 6、DB設計


## users

|------Column------|------Type-------|------Options------------------|
|------------------|-----------------|-------------------------------|
|email             |string           |null :false                    |
|encrypted_password|string           |null :false                    |
|user_name         |string           |null :false                    |
|phone_number      |string           |null :false                    |
|prefecture_id     |integer          |null :false                    |
|city              |string           |null :false                    |
|city_number       |string           |null :false                    |
|postal_number     |string           |null :false                    |
|building          |string           |                               |
|late_name         |string           |null :false                    |
|admins            |references       |null :false, foreign_key :true |
|customers         |references       |null :false, foreign_key :true |
|                  |                 |                               |
|------------------|-----------------|-------------------------------|

### Association
has_one :reservation <br>
belongs_to :customer <br>
belongs_to :admin





## admins

|------Column------|------Type-------|----------------Options------------------|
|------------------|-----------------|-----------------------------------------|
|temple_number     |string           |null :false                              |
|temple_name       |string           |null :false                              |
|admin_name        |string           |null :false, foreign_key :true           |
|encrypted_password|string           |null :false                              |
|email             |string           |null :false                              |
|                  |                 |                                         |
|                  |                 |                                         |
|                  |                 |                                         |
|                  |                 |                                         |
|------------------|-----------------|-----------------------------------------|

### Association
has_many :users <br>
has_many :customers <br>
has_many :reservations 


## reservations

|------Column-----|------Type-------|----------------Options------------------|
|-----------------|-----------------|-----------------------------------------|
|user             |references       |null :false, foreign_key :true            |
|admins           |references       |null :false, foreign_key :true            |
|customers        |references       |null :false, foreign_key :true            |
|reserve_date     |date             |null :false                              |
|-----------------|-----------------|-----------------------------------------|


### Association
belongs_to :user <br>
belongs_to :admin <br>
belongs_to :customer


## customers

|------Column-----|------Type-------|------------------Options----------------|
|-----------------|-----------------|-----------------------------------------|
|danka_number     |string           |null :false                              |
|cemetery_number  |string           |null :false                              |
|cemetery_type_id |integer          |null :false                              |
|cost             |integer          |null :false                              |
|cost_pay_id      |integer          |null :false                              |
|admins_id        |references       |null :false, foreign_key :true            |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|                 |                 |                                         |
|-----------------|-----------------|-----------------------------------------|


### Association
belongs_to :admin <br>
has_one :user <br>
has_one :reservation

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
|user             |references       |null :false foreign_key :true            |
|admins           |references       |null :false foreign_key :true            |
|customers        |references       |null :false foreign_key :true            |
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
|admins_id        |references       |null :false foreign_key :true            |
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

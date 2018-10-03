**Users**

| column name   | data type | details                   |
| :-------------|:--------- | :-------------------------|
| id            | integer   | not null, primary key     |
| email         | string    | not null, indexed, unique |
| fname         | string    | not null                  |
| lname         | string    | not null                  |
| DOB           | datetime  | not null                  |
| gender        | string    |                           |
| session_token |	string	  | not null, indexed, unique |
| created_at	  | datetime  | not null                  |
| updated_at	  | datetime  | not null                  |
| location      | string    |                           |

index on email, unique: true

**Routes**

| column name   | data type | details                        |
| :-------------|:--------- | :------------------------------|
| id            | integer   | not null, primary key          |
| creator_id    | integer   | not null, indexed, foreign key |
| location      | string    | not null                       |
| map           | ?         | not null                       |
| distance      | integer   | not null                       |
| created_at	  | datetime  | not null                       |
| updated_at	  | datetime  | not null                       |

index on creator_id
creator_id references users

**Workouts**

| column name   | data type | details                        |
| :-------------|:--------- | :------------------------------|
| id            | integer   | not null, primary key          |
| user_id       | integer   | not null, indexed, foreign key |
| start_time    | datetime  | not null                       |
| duration      | string    |                                |
| route_id      | integer   | foreign key, indexed           |
| created_at	  | datetime  | not null                       |
| updated_at	  | datetime  | not null                       |

index on user_id
index on route_id
user_id references users
route_id references routes


**Friends**

| column name   | data type | details                        |
| :-------------|:--------- | :------------------------------|
| id            | integer   | not null, primary key          |
| friend1_id    | integer   | not null, indexed, foreign key |
| friend2_id    | integer   | not null, indexed, foreign key |
| created_at	  | datetime  | not null                       |
| updated_at	  | datetime  | not null                       |

index on friend2_id
index on [friend1_id, friend2_id], unique: true
friend2_id references users 
friend1_id references users

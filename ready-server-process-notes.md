# rails-api-template

A template for starting projects with `rails-api`. Includes authentication.

## Dependencies

Install with `bundle install`. ( [`rails-api`](https://github.com/rails-api/rails-api), [`rails`](https://github.com/rails/rails), [`active_model_serializers`](https://github.com/rails-api/active_model_serializers), [`ruby`](https://www.ruby-lang.org/en/), [`postgres`](http://www.postgresql.org)).

## Installation

### Download Template:
1.  Download, unzip, and rename the template directory.
1.  `cd` into the new project and `git init`.

### Customize Template:
1.  Empty [`README.md`](README.md) and fill with your own content.
1.  Rename your app module in `config/application.rb` (change
    `RailsApiTemplate`).
1.  Rename your project database in `config/database.yml` (change
    `'rails-api-template'`).
1.  Project Structure: This template follows the standard project structure in Rails:
    - `curl` command scripts are stored in [`scripts`](scripts) with names that correspond to API actions.
    - User authentication is built-in.

### Setup Environment:
1. Install dependencies with `bundle install`.

2. `git add` and `git commit` your changes.

3. Create a `.env` for sensitive settings (`touch .env`).

4. Generate new `development` and `test` secrets (`bundle exec rails secret`).

5. Store them in `.env` with keys `SECRET_KEY_BASE_<DEVELOPMENT|TEST>`
   respectively.

6. To **make requests to** **deployed API**, set
   `SECRET_KEY_BASE` in the environment of the production API (for example, using `heroku config:set` or the Heroku dashboard).

7. To make **requests from** **deployed client** application, set `CLIENT_ORIGIN` in the environment of the production API (for example, `heroku config:set CLIENT_ORIGIN=https://<github-username>.github.io`). See more about deploying to heroku [rails-heroku-setup-guide](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide), 

   1. For now, LOCALHOST URLs:

      Ready-Server `Localhost: 4741`
      Ready-Client `Localhost: 7165`

8. **Set up the database: `bin/rails db:create`. **Other db commands:

   - bin/rails db:drop (if it already exists)
   - bin/rails db:migrate
   - bin/rails db:seed
   - bin/rails db:examples
   - Note: Follow same commands when setting up deployed database!

9. Run the API server:  `bin/rails server` or `bundle exec rails server`.

10. Back in bash:

    1.  `bin/rais generate scaffold doctors` 
    2. `bin/rails db:migrate`
    3. <u>Issue:</u> Generated doctors model (table) without columns - will need to edit  migrations file to add the columns. Or,
    4. add columns with : `rails generate migration add_email_to_users email:string`

11. `bin/rails db:drop`  Decided to start db from scratch.

12. `git status`, `git add` and `git commit`what's been done so far.

13. Run these tasks often:

-   `bin/rails routes` lists the endpoints available in your API.
-   `bin/rails test` runs automated tests.
-   `bin/rails console` opens a REPL that pre-loads the API.
-   `bin/rails db` opens your database client and loads the correct database.
-   `bin/rails server` starts the API.
-   `scripts/*.sh` run various `curl` commands to test the API. See below.
-   `sql -l` to see a list of databases that I have created.

<!-- TODO -   `rake nag` checks your code style. -->
<!-- TODO -   `rake lint` checks your code for syntax errors. -->

###### Sunday - 7/22 (started by creating db again)

`bin/rails db:create` Output was:

- Created database 'ready-interpreter_development'

- Created database 'ready-interpreter_test'

`bin/rails server`

Created `doctorprofiles`resource `bin/rails generate scaffold doctorprofiles first_name:string last_name:string clinic_affiliation:string sub_specialty_english:string sub_specialty_spanish:string phone_nuber_string notes_string`

`bin/rails db:migrate` and check migration file for typos or to edit. *For instance, with above commands I had to fix a typo for phone_number and delete _string after phone number and notes.*

Run git status, add and commit.

Ran: 

1. `EMAIL='b@example.com' PASSWORD='123' PASSWORD_CONFIRMATION='123' sh ./scripts/auth/sign-up.sh``
2. `EMAIL='beatriz@example.com' PASSWORD='123' PASSWORD_CONFIRMATION='123' sh ./scripts/auth/sign-up.sh``
3. `EMAIL='beatriz.ortiz.2018@example.com' PASSWORD='123' PASSWORD_CONFIRMATION='123' sh ./scripts/auth/sign-up.sh`
4. and kept thinking that there was a problem with the script because I kept getting a 400 message  that email had already been taken.

Running `User.all` in pry showed me that the three users had been created.

Ran `EMAIL='b@example.com' PASSWORD='123' sh ./scripts/auth/sign-in.sh`and output was: 

```bash
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
ETag: W/"cd54a1daaa223ab2e9180dc5dc895f0f"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a2b6a725-3a53-477c-960f-d2fe740cdab1
X-Runtime: 0.110543
Vary: Origin
Transfer-Encoding: chunked

{"user":{"id":1,"email":"b@example.com","token":"BAhJIiU1MDM1OGJkYTJkNzU4ZDM4M2U3Y2E4NzljZjhiNmFkZgY6BkVG--72b857a8ee47c16676edc77d38a4b3d56b0755eb"}}
```

To test being able to change password, ran: `TOKEN='BAhJIiVhMjA2NmZjODFiYWQ1NzZhMTU1NjA1M2VhNDYxYjZkMQY6BkVG--6d5b0f70d1c652c6f24ddf0532fe18d06a5e8d9c' OLDPW='123' NEWPW='abc' sh ./scripts/auth/change-password.sh
HTTP/1.1 204 No Content
Cache-Control: no-cache
X-Request-Id: a3423301-c59b-4fb2-8a10-1b88e08afafc
X-Runtime: 0.148018
Vary: Origin`

1. output was: 

```bas
HTTP/1.1 204 No Content
Cache-Control: no-cache
X-Request-Id: a3423301-c59b-4fb2-8a10-1b88e08afafc
X-Runtime: 0.148018
Vary: Origin
```

To sign out, run: `HTTP/1.1 204 No Content
Cache-Control: no-cache
X-Request-Id: 1e021b45-816d-4895-988e-ee2fc7886361
X-Runtime: 0.016777
Vary: Origin` Output is the same as for changing password.

Finished user auth testing with curl scripts

###### Testing doctorprofiles with curl scripts

1. Completed `create-doctorprofile.sh`based on the `create-example.sh`provided.

2. Using `TOKEN="BAhJIiUxYTMwZTgxZmUwMzg5OTQzMzc1NzQzNjNjMzc2MmFmZAY6BkVG--31a7ef4194227bda11f173dc3864c33ddd2a03b1" FIRST_NAME='Mary' LAST_NAME='Ortiz' CLINIC_AFFILIATION='JF/Jimmy Fund' SUB_SPECIALTY_ENGLISH='Sarcoma' SUB_SPECIALTY_SPANISH='Sarcoma' PHONE_NUMBER='617-632-3333' NOTES='hello, hello' sh ./scripts/doctorprofiles/create-doctorprofile.sh`, tested it and got this output (1st 2 lines): 

3. ```bash
   HTTP/1.1 201 Created
   Location: http://localhost:4741/doctorprofiles/1
   ```

4. The bin/rails server output was: 

5. ```bash
   (0.1ms)  BEGIN
     SQL (10.7ms)  INSERT INTO "doctorprofiles" ("first_name", "last_name", "clinic_affiliation", "sub_specialty_english", "sub_specialty_spanish", "created_at", "updated_at") VALUES (1, 2, 3, 4, 5, 6, $7) RETURNING "id"  [["first_name", "Mary"], ["last_name", "Ortiz"], ["clinic_affiliation", "JF/Jimmy Fund"], ["sub_specialty_english", "Sarcoma"], ["sub_specialty_spanish", "Sarcoma"], ["created_at", "2018-07-22 22:32:59.983301"], ["updated_at", "2018-07-22 22:32:59.983301"]]
   
      (0.4ms)  COMMIT
   [active_model_serializers] Rendered DoctorprofileSerializer with ActiveModelSerializers::Adapter::Json (0.37ms)
   
   Completed 201 Created in 36ms (Views: 3.1ms | ActiveRecord: 15.2ms)
   ```

   

   localhost:4741 messages

   Action taken: `bin/rails db:migrate`

   on `localhost:4741/doctorprofiles` saw:

   ```json
   {
   "doctorprofiles": [
   {
   "id": 1,
   "first_name": "Mary",
   "last_name": "Ortiz",
   "clinic_affiliation": "JF/Jimmy Fund",
   "sub_specialty_english": "Sarcoma",
   "sub_specialty_spanish": "Sarcoma",
   "phone_nuber_string": null,
   "notes_string": null
   }
   ]
   }
   ```

   

















## API

Use this documentation as the basis for my own API documentation. Add a new third-level
heading for my custom entities, and follow the pattern provided for the built-in user authentication documentation.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password`     | `users#changepw`  |
| DELETE | `/sign-out`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
OLDPW='hannah' NEWPW='elle' TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out

Request:

```sh
curl http://localhost:4741/sign-out \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |
| PATCH| `/users/1`  | `users#update`    |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```

#### PATCH /users/:id

Request:

```sh
curl "http://localhost:4741/users/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "user": {
      "email": "'"${EMAIL}"'"
    }
  }'
```

```sh
ID=1 TOKEN="BAhJIiU1NGNlYjRmMjBhM2NkZTZiNzk1MGNiYmZiYWMyY2U4MwY6BkVG--ddb1e16af0e05921aa56d771e4a2f816f2a1d46e"
EMAIL=mike@m
sh scripts/users/user-update.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{"user":{"id":1,"email":"mike@m"}}
```

### Reset Database without dropping

This is not a task developers should run often, but it is sometimes necessary.

**locally**

```sh
bin/rails db:migrate VERSION=0
bin/rails db:migrate db:seed db:examples
```

**heroku**

```sh
heroku run rails db:migrate VERSION=0
heroku run rails db:migrate db:seed db:examples
```

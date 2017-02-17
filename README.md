## Test Application

### Requirements

Ruby  2.3.1

Rails 5.0.1

### Getting started
```
mkdir temp
cd temp
git clone https://github.com/marian13/test_application.git
cd test_application
bundle install
rake db:create
rake db:migrate
export INSTAGRAM_CLIENT_ID='your instagram client id'
export INSTAGRAM_CLIENT_SECRET='your instagram client secret'
rails server
```
### Known issues

1. Majority of specs are failed using `bundle exec rspec spec/some_folder`
but same specs are passed successfully running `bundle exec rspec spec/some_folder/some_spec.rb`

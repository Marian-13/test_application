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
rails server
```
### Notice
This application is allowed to fetch only the 20 most recent photo from
https://www.instagram.com/marian144519/

### Known issues

1. Pagination 'Previous' button isn't working properly
2. Majority of specs are failed using `bundle exec rspec spec/some_folder`
but same specs are passed successfully running `bundle exec rspec spec/some_folder/some_spec`

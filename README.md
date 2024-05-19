# rails_omniauth_sample

## Description
This repository is a sample Rails application utilizing Devise, OmniAuth, and OmniAuth::Apple. The application is built with Ruby 3.2.2 and Rails 7.1.3.2.

## Setup Instructions

### Installation
Add the following gems to your Gemfile:
```ruby
gem 'devise'
gem 'dotenv-rails'
gem 'omniauth'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-apple'
```
Then, run bundle install to install the gems.

```bash
bundle exec rails g devise:install
bundle exec rails g devise user
bundle exec rails g migration add_columns_to_users provider uid username
bundle exec rake db:migrate
```

### Configuring Apple Sign-In environment variables

Set up the following environment variables in your .env file:

- APPLE_CLIENT_ID=
- APPLE_TEAM_ID=
- APPLE_KEY_ID=
- APPLE_PRIVATE_KEY=

### Configure and edit the necessary files

- config/application.rb
- config/routes.rb
- config/environments/development.rb
- config/initializers/devise.rb
- config/initializers/omniauth.rb
- config/initializers/omniauth.rb
- app/controllers/users/omniauth_callbacks_controller.rb
- app/models/user.rb

## Above the errors
### the Can't verify CSRF token authenticity
- [Can't verify CSRF token authenticity when returning from auth · Issue #54 · nhosoya/omniauth-apple](https://github.com/nhosoya/omniauth-apple/issues/54)
- [skip_before_action :verify_authenticity_token](https://qiita.com/nishina555/items/4ffaf5cc57a384b66230#%E3%81%95%E3%81%84%E3%81%94%E3%81%AB)
  - skip_before_action :verify_authenticity_token

### HTTP Origin header (https://appleid.apple.com) didn't match request.base_url
- [Rails5系以上でInvalidAuthenticityTokenエラー #Ruby - Qiita](https://qiita.com/munaita_/items/e1d36fac9515654a76de)

### Blocked host (Temporary measure)

```ruby
config.hosts.clear
```

# Acknowledgments

Special thanks to all contributors and the open-source community for their valuable resources and support.

- [deviseとOmniAuthをRailsアプリケーションに導入しテストする #Ruby - Qiita](https://qiita.com/yuki_0920/items/003d8b1c73352378188d#2-omniauth-%E3%81%A7-google-%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E6%A9%9F%E8%83%BD%E3%82%92%E5%AE%9F%E8%A3%85%E3%81%99%E3%82%8B)


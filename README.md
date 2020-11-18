# Jungle

Welcome to Jungle! A mini e-commerce app built with rails 4.2. The app allows for people to sign up, sign in, add items to cart, view items, checkout and view their order. Admins can add categories of items, add items and view all of the items, removing them as well. 

## Screenshots

!["Default view"]()
!["New interview"]()
!["Delete confirmation"]()

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

The stripe docs for card testing: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt
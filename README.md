# Skills Inventory

This is a prototype application for a company which wishes to allow employees to enter skills which are not core to their current role but may be useful to the company.

The company can then search those skills and contact an employee for assistance with new projects.

#### Software Stack

This app is built using Ruby on Rails 4.1.8 and a postgres database. Testing uses RSpec and Capybara.

#### Setup

In your terminal, run:

``` sh
    git clone https://github.com/surreymagpie/skills.git
    bundle install
    rake db:create db:migrate db:seed
````

To run tests, simply run `guard`

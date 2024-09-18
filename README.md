# Dunkzone 

Welcome to Dunkzone! This application is built using Ruby on Rails. Created by NBA fans for NBA fans, you can view statistics of your favorite teams and players. Read articles and releases dropped by journalists and team managers. Start a discussion in the comment section and share your thoughts about matches and news. In the Store section, you are redirected to the official NBA store. You can also make changes to your profile in the Profile section.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

Make sure you have the following installed:

```
- Ruby -> 2.7.8
- Rails -> 6.1.7.8
- SQLite -> 3.37.2
```
Proxy server must be in running. For more details, refer to the [proxy README](../proxy/README.md).

### Initialization

1. Clone the repository:
```
    git clone https://github.com/dunkz0ne/website.git
    cd website
```
    

2. Install the required gems:
```
    bundle install
``` 

### Database Creation

1. Create and setup the database:
```
    rake db:drop db:create db:migrate db:seed
```    

### Starting the Server

1. Start the Rails server:
```
    rails server
``` 

2. Open your browser and navigate to http://localhost:3000/ to see the application running.

### Starting the test

1. Start the unit test, realized by RSpec:
```
    rspec
``` 

2. Start the behavior test, realized by Cucumber and Capybara and written with Gherkin structure in ./features:
```
    cucumber
```
    
## License

This project is licensed under the MIT License.
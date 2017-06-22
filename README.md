# Stock Robot on Rails

Stock Robot is my side project with the goal of storing the financial data of several thousand companies for use in analytics.
I currently have over 6000 stock symbols, along with the latest trading data and cash flow statements stored. I hope to widen
the data set so that I can automate screening for stocks or ETFs that are currently "ripe" for buying.

## Getting Started

Go to Tradier.com, open a brokerage account and request a developer's API key to get full access to their endpoints.

### Prerequisites

You will need to get an API key from Tradier.com. They will then give you an API key that is limited to 60 calls per minute.
You may create a brokerage account and email a request to their tech support team to supply you a developer's API key,
increasing the call limit to 120 calls per minute along with access to their BETA endpoints which is REQUIRED for this
project.

```
ruby 2.4.1
An API key from Tradier.com which needs to be saved as an environmental variable on your machine.
```

### Installing

A step by step series of examples that tell you have to get a development env running

Using Ruby 2.4.1. If you don't have 2.4.1, run in command line

```
rvm install ruby 2.4.1
```

Use ruby 2.4.1 or default to 2.4.1 in command line

```
rvm use ruby '2.4.1' OR rvm --default '2.4.1'
```
Update all dependencies and gems via

```
bundle update
```

Afterwards, we need to load the database schema with

```
rails db:schema:load
```

Lastly, to seed we need to set the API key for Tradier. This can be setup in an ENV file or in your bash profile. I will
update this repo at some point with commands to generate a secrets file where you can put the key. Otherwise, for now you will
have to set the following variable in your bash profile.

```
export TRADIER_API_KEY="[YOUR KEY HERE]"
```

Once done, you can seed the database.

```
rails db:seed
```

## Running the tests

Tests can simply be run with the 'rspec' command in the console. To run individual tests, run in console 'rspec [spec_file_path]' from the console at the root project directory.

### Break down into feature tests

Feature tests currently only cover front end testing with regards to web app navigation and creation of user accounts as well
as tagging of companies. There are currently no tests to save API calls to the database.

```
RSpec.feature "Ticker", :type => :feature do
  scenario "User can search for a ticker" do
    user = create(:user)
    create_list(:ticker, 100)
    ticker = Ticker.last

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"
    visit (tickers_path)
    
    fill_in "symbol", with: ticker.symbol
    click_on "Search"

    expect(page).to have_current_path(ticker_path(ticker))
  end
end
```

### And model tests

Test models for database relationships and attributes. These tests ensure database integrity and ability to call Active Record
methods properly.

```
User attributes
describe "valid attributes" do
  it { should validate_presence_of(:email_address) }
  it { should validate_uniqueness_of(:email_address) }
  it { should have_secure_password }
end

Sector Relationships
describe "relationships" do
  it "has many tickers" do
    sector = create(:sector)
    expect(sector).to respond_to(:tickers)
  end
end
```

## Deployment

I have included two CSV files that contain stock symbols. The full fat CSV contains over 6000 stock and ETF symbols. The
truncated CSV will have approximately 1000 stock symbols in case you need to seed to a limited deployment environment such as
a free Heroku setup.

## Built With

* [Ruby on Rails](http://rubyonrails.org/) - The web framework used

## Contributing

If you would like to contribute, submit a pull request and I will add you as a contributer. 

## Authors

* **Bao Nguyen** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* I am inspired by the teachings of Benjamin Graham and Warren Buffet. Great investing and long term growth do boil down to
specific strategies and principles. Warren Buffet is known for reading 500 pages of content per day, spending up to 80% of his
day doing it. Not many people will do that in order to become successful as him and I am such a person. This is an attempt to
automate some of that reading. The idea is to collect data from financial reports released by publicly traded companies in
hopes of generating potential valuable information programmatically.

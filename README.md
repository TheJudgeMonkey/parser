[![Ruby](https://github.com/TheJudgeMonkey/parser/actions/workflows/ruby.yml/badge.svg)](https://github.com/TheJudgeMonkey/parser/actions/workflows/ruby.yml)
# Log Parser

### About

It's a **Ruby Developer Test** for **Smart Pension**

## Task 
Firstly, the test should take you no more than 2.5 hours to complete. Secondly, the test is for us to see how you code and the methodologies you use, what we will be looking for in this test are the following:

- Functionality
- Efficiency – We like clean, simple code.
- Readability
- Tests (we have 96% test coverage in our code and we aim to keep it that way).
- Also, we would like to understand your ability to use TDD and OO, so please ensure these are part of your complete test.
- Feel free to submit your solution as a link to your version control repository

The test is as follows:

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided) *e.g.:*
```bash
./parser.rb webserver.log
```

b. Returns the following:
- list of webpages with most page views ordered from most pages views to less page views *e.g.:*
```bash
/home 90 visits 
/index 80 visits etc... 
```
- list of webpages with most
unique page views also ordered *e.g.:*
```bash
/about/2 8 unique views
/index 5 unique views etc...
```

> Finally, have some fun – Feel free to make changes or design something if you think it meets the criteria above, but would produce better outcomes and of course, the sooner you return the test, the quicker we can move the process.

## Installing
ruby v.3.0.0
- Clone  `git clone git@github.com:TheJudgeMonkey/parser.git`
- Go to the parser folder `cd parser/`
- Run `bundle install`

## Running
- Run `ruby parser.rb webserver.log`

## Testing
- For rubocop: `bundle exec rubocop -A`
- For RSpec `bundle exec rspec`

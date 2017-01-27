# README

[DTR](https://docs.google.com/document/d/1GkAkzkCFK8TgeqYdQT3g5rwvcV6zoil0EvMYqYZrZLQ/edit?usp=sharing)


## Rails Engine 
This project was developed by [Eric](https://github.com/cews7) and I as our introduction to APIs and working with JSON both sending and recieving. 
We created an API that consumes CSV files that represent sales history between Merchants, Customers, Items, Invoices, Transactions and their respective Invoiced Items
per sale transaction. The API will then respond to get requests for various relationships between these data tables and respond with JSON.

## Installation
  Clone the git repository

  bundle install

  bin/rake db:{create,migrate,seed}

  rspec -will run internal test suite

  open coverage/index.html -will open html read out for spec coverage in rspec


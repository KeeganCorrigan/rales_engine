# Rales Engine


## Sales Engine with an R because Rails.

### Rales Engine is a JSON API that exposes sales data from a dataset pulled from [Etsy](https://www.etsy.com).
#### This project was completed as part of the Back End Module 3 curriculumn at Turing. The spec for the project can be found [here](http://backend.turing.io/module3/projects/rails_engine)
___
## How to set up the API to run locally.

1. Clone this repo
    * `$ git clone git@github.com:KeeganCorrigan/rales_engine.git`

2. Run these commands:
    * `$ cd rales_engine`
    * `$ bundle update`
    * `$ rails db:{drop,create,migrate}`
    * `$ rake import:sales_engine_data` (Seeds the database with the included CSVs. This takes a few minutes.)
    * `$ rails s`
    * If you want to run a local test suite `$ rspec` otherwise you can open up `localhost:3000` in your browser and try a route!

      ---
      ```ruby
      Some Example Endpoints:
      GET /api/v1/merchants/:id/revenue
      GET /api/v1/merchants/:id/revenue?date=x
      GET /api/v1/merchants/most_items?quantity=x
      GET /api/v1/customers/:id/favorite_merchant
      GET /api/v1/items/:id/best_day
      GET /api/v1/items/most_items?quantity=x
      GET /api/v1/invoices/:id/items #returns a collection of associated items
      GET /api/v1/invoices/:id/customer #returns the associated customer

      Some Example Business Intelligence Endpoints:
      GET /api/v1/merchants/most_revenue?quantity=x #returns the top x merchants ranked by total revenue
      GET /api/v1/merchants/most_items?quantity=x #returns the top x merchants ranked by total number of items sold
      GET /api/v1/merchants/revenue?date=x #returns the total revenue for date x across all merchants
      GET /api/v1/items/most_revenue?quantity=x #returns the top x items ranked by total revenue generated
      GET /api/v1/items/most_items?quantity=x #returns the top x item instances ranked by total number sold
      GET /api/v1/items/:id/best_day #returns the date with the most sales for the given item using the invoice date.
      ```
      ---

3. To test the API against the spec harness we worked with, clone it down from [here](https://github.com/turingschool/rales_engine_spec_harness)
    * `$ git clone https://github.com/turingschool/rales_engine_spec_harness.git`
    * `$ cd rales_engine_spec_harness`
    * `$ bundle`
    * then run `$ rails s` in the API directory and run `$ rake` in the speck harness directory.
___

### We used Ruby version 2.4.1 and Rails version 5.1.6
___
### To Return all of the required data we used both ActiveRecord and SQL
#### examples:
  ```ruby
  class Item
  def most_sold_by_day
      invoices
      .select("sum(invoice_items.quantity) AS total_quantity, invoices.*")
      .joins(:invoice_items, :transactions)
      .merge(Transaction.success)
      .group("date_trunc('day', invoice_items.created_at), invoices.id")
      .order("total_quantity DESC")
      .limit(1)
      .first
      .created_at
    end
  end
  ```
  ```ruby
  class Customer
    def self.customers_with_pending_invoices(merchant_id)
      find_by_sql(
                    "SELECT c.* FROM customers c
                    INNER JOIN invoices i ON i.customer_id = c.id
                    WHERE i.merchant_id = #{merchant_id}
                      EXCEPT
                      SELECT c.* FROM customers c
                      INNER JOIN invoices i ON i.customer_id = c.id
                      INNER JOIN transactions t ON t.invoice_id = i.id
                      WHERE i.merchant_id = #{merchant_id} AND t.result = 'success'
                    ;"
                  )
    end
  end
  ```

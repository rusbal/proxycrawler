# Manual Crawler
Supposedly crawling should run as a scheduled background process.  I wasn't able to finish the requirements because of time constraints.  I accomplished the most important part of the task to show my abilities as a programmer.

## How It Works
1. Manually insert records
   ```
   $ rails console
   [3] pry(main)> FactoryBot.create(:request_url, url: "https://www.amazon.com/s?k=drill+bit+set&ref=nb_sb_noss")
   ```
2. Run the Rails app
   ```
   $ rails server
   ```
3. Open http://localhost:3000/request_urls on browser
4. Manually initiate crawl action by clicking on [Crawl] button
5. The crawler will run and will display "Successfully crawled" upon success.  Requested At and Crawled At fields will be populated.
6. Navigate to http://localhost:3000/products to see the results

## Models
1. ProxyCrawlRequestUrl
   * url
   * requested_at
   * crawled_at

2. AmazonProduct
   * amazon_asin
   * name
   * price_symbol
   * price
   * price_crossed_out
   * image_url
   * rating
   * review_count

## Service Objects
1. ProxyCrawler
2. ResponseBodyProcessor

## Additional Gems Used
1. nokogiri
2. pry-rails
3. pry-byebug
4. rspec-rails
5. factory_bot_rails
6. faker
7. database_cleaner-active_record
8. shoulda-matchers

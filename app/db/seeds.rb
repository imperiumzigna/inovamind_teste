scraper = Scraper.new(url: "http://quotes.toscrape.com")
# Seeds quotes to database
quotes = scraper.get_all_formated_quotes


quotes.each do |quote|
    Quote.create!(quote)
end
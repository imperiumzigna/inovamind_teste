class NewQuoteWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(quotes = [])
    unless quotes.empty?
      quotes.each do |quote|
      Quote.create!(quote)
      end
    end
  end
end

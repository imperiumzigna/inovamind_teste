class QuotesController < ApplicationController

    def index
        @quotes = Quote.all
        render :index
    end

    def search
      @quotes =  Quote.all_in(tags: [params[:search_tag]]).to_a
      if @quotes.empty?
       @quotes = SCRAPER.search_quote(params[:search_tag])
       NewQuoteWorker.perform_async(@quotes)
       render :search_results
      else
        render :search_results
      end
    end
end

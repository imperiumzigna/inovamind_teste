require 'uri'

class Scraper
    attr_accessor :url
    attr_accessor :raw_document
    attr_accessor :parsed_page

    def initialize(url: )
        @url = url_validator(url)
        @raw_document = HTTParty.get(self.url)
        @parsed_page ||= Nokogiri::HTML(self.raw_document) 
    end

    def get_all_quotes
       quote_container.css(".text").children.map { |quote| quote.text}.compact
    end
    
    def get_all_authors
        quote_container.css(".author").children.map { |quote| quote.text}.compact
    end

    def get_all_tags
        quote_container.search(".keywords").map {|n| n['content']}.compact
    end

    def get_all_author_about
        quote_container.css("span a").map { |link| link['href'] }.compact
    end

    def get_all_formated_quotes
        quote_container.map{ |quote| {quote: quote.css(".text").text,
                                      author: quote.css(".author").text,
                                      author_about: "#{self.url}#{ quote.css("span a").map { |link| link['href'] }.first}",
                                      tags: quote.css(".keywords").map {|n| n['content']}.first.split(",") 
                                      } 
                            } 
    end

    def search_quote(tag= "")
        search_url = url_validator("#{self.url}/tag/#{tag.downcase}")
        search_raw_document = HTTParty.get(search_url)
        search_parsed_page ||= Nokogiri::HTML(search_raw_document)
        
        search_parsed_page.css(".quote").map{ |quote| {
            quote: quote.css(".text").text,
            author: quote.css(".author").text,
            author_about: "#{self.url}#{ quote.css("span a").map { |link| link['href'] }.first}",
            tags: quote.css(".keywords").map {|n| n['content']}.first.split(",")
                                                      } 
                                            }
    end

    private
    
    def url_validator(base_url)  
        url = URI.parse(base_url) 
        if( url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS))
         return base_url   
        else
        raise ArgumentError.new("Url não é válida")     
        end    
    end

    def quote_container
        parsed_page.css(".quote")
    end

   

end
class HomeController < ApplicationController
  def index

    require 'net/http'
    require 'json'

    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=bf7bf6df-77bd-442e-8e9f-b7a0a82d9605&start=1&limit=5000&convert=USD'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "XRP", "ADA", "XLM", "STEEM"]
   


  end

  def about
  end

  def lookup
    require 'net/http'
    require 'json'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=bf7bf6df-77bd-442e-8e9f-b7a0a82d9605&start=1&limit=5000&convert=USD'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)
   
    @symbol = params[:sym]

    if @symbol
      @symbol = @symbol.upcase
    end

    if @symbol == ""
       @symbol = "Hey You Forgot To Enter A Currency!"
    end  

  end
end


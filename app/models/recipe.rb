require 'uri'
require 'net/http'

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipesingredient
  has_many :favorited_by, through: :favorites, source: :user
  has_many :reviews

  # include PgSearch::Model
  # pg_search_scope :search_by_title,
  #   against: [ :title ],
  #   using: {s
  #     tsearch: { prefix: true }
  #   }

  attr_accessor :search

  def self.search(ingredients = '')
    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=#{ingredients}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["RAPID_API"]
    # request["Content-Type"] = 'charset=utf-8'
    # 'application/json'
    # 'charset=utf-8'
    request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    begin
      response = http.request(request)
      results = JSON.parse(response.read_body.force_encoding("UTF-8"))
    rescue StandardError
      results = false
    end
    results
  end

  def self.search_recipe(id)
    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{id}/information")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["RAPID_API"]
    request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    response = http.request(request)
    JSON.parse(response.body)
  end
end
# hello

require "json"
require "http"
require "optparse"

class Cafe < ApplicationRecord

  CLIENT_ID = ENV["yelp_app_id"]
  CLIENT_SECRET = ENV["yelp_app_secret"]


  # Constants, do not change these
  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
  TOKEN_PATH = "/oauth2/token"
  GRANT_TYPE = "client_credentials"


  DEFAULT_BUSINESS_ID = "yelp-minneapolis"
  DEFAULT_TERM = "coffee"
  DEFAULT_LOCATION = "Minneapolis, MN"
  SEARCH_LIMIT = 25


  # Make a request to the Fusion API token endpoint to get the access token.
  #
  # host - the API's host
  # path - the oauth2 token path
  #
  # Examples
  #
  #   bearer_token
  #   # => "Bearer some_fake_access_token"
  #
  # Returns your access token
  def self.bearer_token
    # Put the url together
    url = "#{API_HOST}#{TOKEN_PATH}"

    raise "Please set your CLIENT_ID" if CLIENT_ID.nil?
    raise "Please set your CLIENT_SECRET" if CLIENT_SECRET.nil?

    # Build our params hash
    params = {
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      grant_type: GRANT_TYPE
    }

    response = HTTP.post(url, params: params)
    parsed = response.parse

    "#{parsed['token_type']} #{parsed['access_token']}"
  end


  # Make a request to the Fusion search endpoint. Full documentation is online at:
  # https://www.yelp.com/developers/documentation/v3/business_search
  #
  # term - search term used to find businesses
  # location - what geographic location the search should happen
  # Returns a parsed json object of the request
  def self.search(location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: "coffee",
      location: location,
      limit: SEARCH_LIMIT
    }

    response = HTTP.auth(bearer_token).get(url, params: params)
    @@search_results = response.parse
  end

  def self.save
    @@search_results.each do |business|
      self.new()
    end
  end
end

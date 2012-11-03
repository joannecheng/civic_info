require 'httparty'
require 'active_support/core_ext/hash/indifferent_access'

class GoogleAPI

  def initialize(api_key, service_name)
    @api_key = ENV['GOOGLE_API_KEY']
    @service_url = "https://www.googleapis.com#{service_name}"
  end

  def get(call_string)
    HTTParty.get("#{@service_url}#{call_string}?key=#{@api_key}").with_indifferent_access
  end

  def post(call_string, body = {})
    HTTParty.post("#{@service_url}#{call_string}?key=#{@api_key}",
      :body => body 
    ).with_indifferent_access
  end


end

class CivicInfo

  def initialize
    raise if ENV['GOOGLE_API_KEY'].nil?
    @google_api = GoogleAPI.new(ENV['GOOGLE_API_KEY'], '/civicinfo/us_v1/')
  end

  def elections
    call_string = 'elections'
    @google_api.get(call_string)
  end

  def voter_info(election_id, address)
    call_string = "voterinfo/#{election_id}/lookup"
    body = { :address => address }

    @google_api.post(call_string, body)
  end

end

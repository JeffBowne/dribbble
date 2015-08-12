require 'net/http'
require 'json'

class APIS::Dribbble

  def dribbble_api_query
    uri = URI("http://api.dribbble.com/shots/everyone")
    Net::HTTP.get(uri)
  end

  def dribbble_process
    # raw_data = dribbble_api_query
    # rubyHash = JSON.parse(raw_data)
    # final_data = []
    # rubyHash["shots"].each { |shot| final_data.push(title: shot["title"], image_url: shot["url"], likes_count: shot["likes_count"])}
    # final_data

    JSON.parse(dribbble_api_query)["shots"].map {|shot| {title: shot["title"], image_url: shot["url"], likes_count: shot["likes_count"]} }
  end

  #get all shots
  def dribbble_get_shots
    JSON.parse(Net::HTTP.get(URI("http://api.dribbble.com/shots/everyone")))["shots"]
  end

  #get a shot by its id
  def dribbble_get_shot id
    JSON.parse(Net::HTTP.get(URI("http://api.dribbble.com/shots/#{id}")))
  end

  def dribbble_get_rebounds id
    JSON.parse(Net::HTTP.get(URI("http://api.dribbble.com/shots/#{id}/rebounds")))["shots"]
  end
end
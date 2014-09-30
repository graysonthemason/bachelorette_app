require 'sinatra/base'
require 'redis'
require 'json'
require 'uri'
require 'pry'

class App < Sinatra::Base

  ########################
  # Configuration
  ########################

  configure do
    enable :logging
    enable :method_override
    enable :sessions
    $admin = false
    uri = URI.parse(ENV["REDISTOGO_URL"])
    $redis = Redis.new({:host => uri.host,
                        :port => uri.port,
                        :password => uri.password})
  end

  before do
    logger.info "Request Headers: #{headers}"
    logger.warn "Params: #{params}"
  end

  after do
    logger.info "Response Headers: #{response.headers}"
  end

  ########################
  # Routes
  ########################

  get('/') do
    if params["admin"] == true
      @show_page_edits = true
    end
      # binding.pry
    @cheeses = []
    $redis.keys('*cheese*').each do |key|
      @cheeses << get_model_from_redis(key)
    end
    render(:erb, :"cheeses/index")
    # binding.pry
  end

  get('/admin') do
  redirect to('/?admin=true')
  end

  get('/cheeses/:id') do
    @cheese = get_model_from_redis("cheeses:#{params[:id]}")
    @cheese["show"] = true
    render(:erb, :"cheeses/show")
  end


  get('/cheese_form') do
    if params[:sent] == "true"
      @show_contact_success_message = true
    end
    render(:erb, :"cheeses/cheese_form")
  end

  post('/cheese') do
    @name = params[:name]
    @country = params[:country]
    @milk_type = params[:milk_type]
    @stank_level = params[:stank_level]
    @desc = params[:desc]
    @image_url = params[:image_url]
    id = "cheeses:#{$redis.keys.count}"
    $redis.set(id, params.to_json)
    redirect to('/cheese_form?sent=true')
  end

  post('/update_form_request/:id') do
    @cheese = JSON.parse($redis.get("#{params[:id]}"))
    id = params[:id]
    $redis.set(id, params.to_json)
    render(:erb, :"cheeses/cheese_update_form")
    # binding.pry
  end

  delete('/cheese/:id') do
    # binding.pry
    $redis.del("#{params[:id]}")
    redirect to('/')
  end

  # put('/update_form_request/:id') do

  # end

  def get_model_from_redis(redis_id)
    model       = JSON.parse($redis.get(redis_id))
    model["id"] = redis_id
    model
  end
end

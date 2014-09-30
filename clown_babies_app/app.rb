require 'sinatra/base'
require 'securerandom'
require 'pry'
require 'httparty'


class App < Sinatra::Base

  ########################
  # Configuration
  ########################

  configure do
    enable :logging
    enable :method_override
    enable :sessions
  end

  before do
    logger.info "Request Headers: #{headers}"
    logger.warn "Params: #{params}"
  end

  after do
    logger.info "Response Headers: #{response.headers}"
  end
 #########################
  # API KEYS
#########################
  CLIENT_ID = "551378232163-j3n3k7gur71ilgrrshbcv31a03nvvjt5.apps.googleusercontent.com"

CLIENT_SECRET = "yzlujUJtaOlHNr1yp9f_6RTF"
REDIRECT_URIS = "http://127.0.0.1:9292/oauth_callback"
JAVASCRIPT_ORIGINS = "http://127.0.0.1:9292/"

  ########################
  # Routes
  ########################

  get('/') do
    @url = "https://accounts.google.com/o/oauth2/auth?response_type=code&scope=profile&state=#{SecureRandom.urlsafe_base64}&redirect_uri=#{REDIRECT_URIS}&client_id=#{CLIENT_ID}"




    # response_type=code&
    # scope=profile&
    # state=SecureRandom.urlsafe_base64&
    # redirect_uri=REDIRECT_URIS&
    # client_id=CLIENT_ID&
    render(:erb, :index)
  end
  get('/oauth_callback') do
    # if session[:state] == params[:state]

      @state = "1oQ71oJ6hrlV9ELClWol-w"
       @code = "4/ZwrmnA-YwloFrCD7yFQInaDzFcT4.4l9AryiqrCIfJvIeHux6iLY97wSFkAI"
       @url = "https://accounts.google.com/o/oauth2/auth/?code=#{@code}&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&redirect_uri=#{REDIRECT_URIS}&grant_type=authorization_code"
    

    response = HTTParty.post(
      "https://accounts.google.com/o/oauth2/auth",
      { :body=>
          code: @code,
          client_id: CLIENT_ID,
          client_secret: CLIENT_SECRET,
          redirect_uri: REDIRECT_URIS,
          grant_type: authorization_code
}
)

     end
  # end

end








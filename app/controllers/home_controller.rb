class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:show, :stats]
	#Get all currebt user shorten urls
	def index
		@urls = current_user.shortened_urls
	end
  #Redirect to shorten url
  def show
  	token = ::Shortener::ShortenedUrl.extract_token(params[:id])
  	url   = ::Shortener::ShortenedUrl.fetch_with_token(token: token, additional_params: params)
		# do some logging, store some stats
		redirect_to url[:url], status: :moved_permanently
	end
  #To show statics all
  def stats
  	@stats_all = Shortener::ShortenedUrl.all
  end
end

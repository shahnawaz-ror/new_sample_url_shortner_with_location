class UrlShortsController < ApplicationController
  before_action :authenticate_user!
  # GET /url_shorts/new
  def new
    @url_short = UrlShort.new
  end

  # POST /url_shorts or /url_shorts.json
  def create
    Shortener::ShortenedUrl.generate(params[:url_short][:link], owner: current_user, expires_at: 24.hours.since)
    redirect_to new_url_short_path
  end

  private
    # Only allow a list of trusted parameters through.
    def url_short_params
      params.require(:url_short).permit(:link)
    end
end

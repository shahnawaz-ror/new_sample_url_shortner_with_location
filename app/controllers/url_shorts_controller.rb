# frozen_string_literal: true

class UrlShortsController < ApplicationController
  # GET /url_shorts/new
  def new
    @url_short = UrlShort.new
  end

  # POST /url_shorts or /url_shorts.json
  def create
    @data = if current_user.present?
              Shortener::ShortenedUrl.generate(params[:url_short][:link], owner: current_user,
                                                                          expires_at: 24.hours.since)
            else
              Shortener::ShortenedUrl.generate(params[:url_short][:link], expires_at: 24.hours.since)
            end
    respond_to do |format|
      format.js { render 'url_shorts/status' }
    end
  rescue Exception => e
    @error = true
    @error_data = e
    respond_to do |format|
      format.js { render 'url_shorts/status' }
    end

    # redirect_to new_url_short_path
  end

  private

  # Only allow a list of trusted parameters through.
  def url_short_params
    params.require(:url_short).permit(:link)
  end
end

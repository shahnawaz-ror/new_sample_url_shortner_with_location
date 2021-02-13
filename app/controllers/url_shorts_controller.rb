class UrlShortsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_url_short, only: %i[ show edit update destroy ]

  # GET /url_shorts or /url_shorts.json
  def index
    @url_shorts = UrlShort.all
  end

  # GET /url_shorts/1 or /url_shorts/1.json
  def show
  end

  # GET /url_shorts/new
  def new
    @url_short = UrlShort.new
  end

  # GET /url_shorts/1/edit
  def edit
  end

  # POST /url_shorts or /url_shorts.json
  def create
    # @url_short = UrlShort.new(url_short_params)
    # debugger
    # Shortener::ShortenedUrl.generate("example.com/page", current_user, expires_at: 24.hours.since)
Shortener::ShortenedUrl.generate(params[:url_short][:link], owner: current_user, expires_at: 24.hours.since)

    # @url_short = Shortener::ShortenedUrl.generate(params[:url_short][:link],current_user,current_user, expires_at: 30.days.since)
    # @url_short = Shortener::ShortenedUrl.generate("http://example.com")
    redirect_to new_url_short_path
      # respond_to do |format|
      #   if @url_short.save
      #     format.html { redirect_to @url_short, notice: "Url short was successfully created." }
      #     format.json { render :show, status: :created, location: @url_short }
      #   else
      #     format.html { render :new, status: :unprocessable_entity }
      #     format.json { render json: @url_short.errors, status: :unprocessable_entity }
      #   end
      # end
  end

  # PATCH/PUT /url_shorts/1 or /url_shorts/1.json
  def update
    respond_to do |format|
      if @url_short.update(url_short_params)
        format.html { redirect_to @url_short, notice: "Url short was successfully updated." }
        format.json { render :show, status: :ok, location: @url_short }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @url_short.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_shorts/1 or /url_shorts/1.json
  def destroy
    @url_short.destroy
    respond_to do |format|
      format.html { redirect_to url_shorts_url, notice: "Url short was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_short
      @url_short = UrlShort.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_short_params
      params.require(:url_short).permit(:link)
    end
end

# frozen_string_literal: true

module Shortener
  class ShortenedUrlsController < ActionController::Metal
    include ActionController::StrongParameters
    include ActionController::Redirecting
    include ActionController::Instrumentation
    include Rails.application.routes.url_helpers
    include Shortener

    # Update the country and IP address while visit links
    def show
      token = ::Shortener::ShortenedUrl.extract_token(params[:id])
      track = Shortener.ignore_robots.blank? || request.human?
      url   = ::Shortener::ShortenedUrl.fetch_with_token(token: token, additional_params: params, track: track)
      country = ISO3166::Country[request.location.country]
      name = begin
        (country.translations[I18n.locale.to_s] || country.name)
      rescue StandardError
        ''
      end
      Country.create(url_id: url[:shortened_url]&.id, name: country, ip: request.location.ip)
      redirect_to url[:url], status: :moved_permanently
    end
  end
end

# frozen_string_literal: true

json.extract! url_short, :id, :link, :created_at, :updated_at
json.url url_short_url(url_short, format: :json)

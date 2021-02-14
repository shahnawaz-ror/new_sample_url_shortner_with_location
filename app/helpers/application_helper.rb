# frozen_string_literal: true

module ApplicationHelper
  def get_all_top_country(data)
    @data = []
    names = begin
      Country.where(url_id: data.id).pluck(:name)
    rescue StandardError
      []
    end
    counts = Hash.new(0)
    data_result = names.each_with_object(
      Hash.new(0)
    ) do |e, total|
      total[e] += 1
    end
    result = data_result.sort_by { |_key, value| value }.reverse
    result[0..2].each do |obj|
      @data << obj[0]
    end
    @data = begin
      @data.join(',')
    rescue StandardError
      ''
    end
  rescue Exception => e
    @data = ''
  end
end

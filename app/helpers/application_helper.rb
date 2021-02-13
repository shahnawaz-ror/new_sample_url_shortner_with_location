module ApplicationHelper
	def get_all_top_country(data)
		begin
			@data = [] 
			names = Country.where(url_id: data.id).pluck(:name) rescue []
			counts = Hash.new(0)
			data_result = names.inject(
				Hash.new(0)
				) { |total, e| 
				total[e] += 1 ;
				total
			}
			result = data_result.sort_by {|_key, value| value}.reverse
			result[0..3].each do |obj|
				@data << obj[0]
			end
			@data = @data.join(',') rescue ''
		rescue Exception => e
			@data = ""
		end
	end
end

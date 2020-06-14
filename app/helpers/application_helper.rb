module ApplicationHelper
	# 桁区切りを追加するヘルパーメソッドです
	def converting_to_jpy(price)
		"#{price.to_s(:delimited, delimiter: ',')}"
	end
end

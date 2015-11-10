class Product < ActiveRecord::Base

	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			#Product.create! row.to_hash
			row.to_hash
			# 1. csv complete, 2.git 3.jenkins 4.sanal bolgoh unix
		end

	end
end

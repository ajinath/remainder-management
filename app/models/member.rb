class Member < ActiveRecord::Base
	require 'csv'
	belongs_to :user

	def self.import(file, user_id)
		begin
			CSV.foreach(file.path, headers: true) do |row|
				row = row.to_h
				member = Member.find_or_initialize_by(contact: row['contact'], user_id: user_id)
				member.name = row['name']
				member.save
			end
		rescue Exception => e
			false
		end
		true
	end
end

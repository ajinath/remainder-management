class Member < ActiveRecord::Base
	require 'csv'
	belongs_to :user

	def self.import(file, user_id)
		begin
			CSV.foreach(file.path, headers: true) do |row|
				members_hash = row.to_hash
				members_hash['user_id'] = user_id
				member = Member.where(contact: members_hash['contact'])
				next if member.count == 1
				Member.create(members_hash)
			end
		rescue Exception => e
			false
		end
		true
	end
end

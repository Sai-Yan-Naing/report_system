class Report < ApplicationRecord
	validates :date, presence: true
	validates :morning, presence: true, length:{minimum:20}
	validates :evening, presence: true, length:{minimum:20}
end

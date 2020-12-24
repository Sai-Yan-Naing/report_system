class Report < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
	validates :morning, presence: true, length:{minimum:20}
	validates :evening, presence: true, length:{minimum:20}

	def self.to_csv
	    attributes = %w{id date morning evening remark}

	    csv_data=CSV.generate(headers: true) do |csv|
	      csv << attributes

	      all.each do |report|
	        csv << [
	        	report.id,
	        	"\t001",
	        	"\t"+report.morning,
	        	"\t"+report.evening,
	        	report.remark+"\t",
	        ]
	      end
	    end
	  end


	  def self.search(search)
		    # if search
		    	# Report.all
		        # Report.where(['morning LIKE (?)', "morning"])
		        # Report.where("morning LIKE '"%#{params[:search]}%'" ")
		    # else
		    #     Report.all 
		    # end
		    # return Report.all unless search
      		# Report.where(['morning LIKE ? or evening LIKE ? or date LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" ]).order(:date)
      		if search
      			Report.where(['morning LIKE ? or evening LIKE ? or date LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" ]).order(:date)
      		else
      			Report.all
      		end

		end


	   # def self.to_csv(options = {})
    #     attributes = %w{id date morningplan eveningplan remark}
    
    #     CSV.generate(options) do |csv|
    #       csv << attributes
    
    #       all.each do |post|
    #         csv << attributes.map{ |attr| post.send(attr) }
    #       end
    #     end
    # end
	# def self.to_csv (option = {})
	# 	CSV.generate (option) do |csv|
	# 		csv<< column_names
	# 		all.each do |report|
	# 			csv << report.values_at('column_names')
	# 		end
	# 	end
	# end
end

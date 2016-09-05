class Address < ApplicationRecord
	belongs_to :order, optional: true 
	belongs_to :user

	validates :line1, presence: true
	validates :city, presence: true
	validates :state, presence: true, length: { maximum: 2 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	validates :zip, presence: true, length: { maximum: 4 }, numericality: {only_integer: true}


	def to_s
		if !line2.empty? 
    		"#{line1}, #{line2}, #{city}, #{state}, #{zip}"
    	else
    		"#{line1}, #{city}, #{state}, #{zip}"
    	end
  	end

end
class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: {scope: [:artist_name, :release_year], message: "Cannot be repeated by the same artist in the same year"} 
    # validates :released, inclusion: {in: [true, false]} this is not what they were asking
	validates_presence_of :release_year, :if => :released?
	validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, :if => :released?  
	validates :artist_name, presence: true
end


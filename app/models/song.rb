class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: {scope: [:artist_name, :release_year], message: "Cannot be repeated by the same artist in the same year"} 
    validates :released, inclusion: {in: %w(true false)}
end

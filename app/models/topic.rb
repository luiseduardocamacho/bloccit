class Topic < ActiveRecord::Base
   belongs_to :rating
   has_many :posts
   has_many :posts, dependent: :destroy
   has_many :labelings, as: :labelable
   has_many :labels, through: :labelings

   def update_rating(rating_string)
     self.rating = Rating.find_by severity: rating_string
   end
end

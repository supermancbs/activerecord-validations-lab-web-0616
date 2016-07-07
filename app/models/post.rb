class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :clickbait, acceptance: true 

# Finally, add a custom validator to Post that ensures the title is sufficiently
# clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top
# [number]", or "Guess", the validator should return false.

  def clickbait
    if !title
      return false
    end 
    title = self.title.split(" ")
    
    if title.include?("Won't") || title.include?("Believe") || title.include?("Secret") || title.include?("Top") ||title.include?("Guess") 
      
    else 

      return false
    end 
  end 
end



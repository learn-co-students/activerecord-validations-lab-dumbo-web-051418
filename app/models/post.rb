class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-fiction)}
  validate :non_clickbait

  def non_clickbait
    self.title && split_title = self.title.split(" ")

    if self.title.nil?
      errors.add(:title, "This title is not clickbait")
    elsif !split_title.include?("Won't" || "Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "This title is not clickbait")
    end
  end

end

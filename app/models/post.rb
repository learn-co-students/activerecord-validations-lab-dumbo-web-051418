class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 200 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clicky?


  def clicky?

    title = self.title
    if title != nil && !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess") || title.match('Top [0-9]'))
      errors.add(:title, 'Not enough clickbait.')
    end

  end
end

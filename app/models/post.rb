class MyValidator < ActiveModel::Validator
  def validate(post)
    post_down = post.title.downcase
    unless !(post_down.include?("won't believe") || post_down.include?("secret") || post_down.include?("guess") || post_down.match(/top [0123456789]/))
      record.errors[:title] << 'Clickbait detected.'
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 200 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

  # include ActiveModel::Validations
  # validates_with MyValidator
end

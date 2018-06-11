class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 30}
  validates :summary, length: {maximum: 50}
  validates :category, acceptance: {accept: "Fiction"}
  validates :title, acceptance: {accept: "You Won't Believe These True Facts"} 
end

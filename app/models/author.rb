class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, presence: true, length: {in: 10..17}
end

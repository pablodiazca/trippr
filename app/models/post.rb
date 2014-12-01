class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :country, presence: true
  validates :place, presence: true
  validates :category, presence: true

end

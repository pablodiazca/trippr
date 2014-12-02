class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :country, presence: true
  validates :place, presence: true
  validates :category, presence: true

  has_attached_file :avatar, :styles => { :main => "900x600#", :medium => "300x300#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true
  validates :country, presence: true
  validates :place, presence: true
  validates :category, presence: true

  before_save :format_address

  before_save :rating_post

  has_attached_file :picture, :styles => { :main => "900x600#", :medium => "300x300#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  scope :recent, -> {order("created_at DESC")}

  scope :food, -> {where(category: 'food').limit(5)}

  scope :culture, -> {where(category: 'culture').limit(5)}

  scope :shop, -> {where(category: 'shop').limit(5)}

  scope :sports, -> {where(category: 'sports').limit(5)}

  scope :random, -> {order("RANDOM()").limit(1)}

  def format_address
    @client = GooglePlaces::Client.new(Rails.application.secrets.google_places_api_key)
    @q = @client.spots_by_query(self.place).first.formatted_address
    self.formatted_address = @q
  end
  
  def rating_post
    @client = GooglePlaces::Client.new(Rails.application.secrets.google_places_api_key)
    @q = @client.spots_by_query(self.place).first.rating
    self.rating = @q
  end

  def liked_for(user)
    likes.find_by_user_id user
  end

end

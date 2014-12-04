class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :post_id, uniqueness: {scope: :user_id}

  scope :recent_likes, -> {order("created_at DESC").limit(5)}

end

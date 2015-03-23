class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  acts_as_followable
  acts_as_follower

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_attached_file :avatar, 
                    :styles => { :medium => "600x600#", :thumb => "200x200#" }, 
                    :default_url => "/images/:style/missing.png",
                    :url  => "/assets/avatars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"
  
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }


  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze.strip
    else
      email
    end
  end

  def following_record_for(other_user)
    Follow.for_follower(self).for_followable(other_user).first
  end
end

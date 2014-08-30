class Post < ActiveRecord::Base
  
  validates :content, :author_id, :title, presence: true 
  
  belongs_to( 
    :moderator,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  belongs_to :sub
  
  has_many :post_subs
  
  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )
  
end

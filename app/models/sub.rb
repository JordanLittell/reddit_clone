class Sub < ActiveRecord::Base
  
  validates :description, :title, :author_id, presence: true
  
  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  ) 
  has_many( 
    :post_subs,
  )
  has_many( 
    :posts,
    :through => :post_subs, 
    :source => :post
  )
end

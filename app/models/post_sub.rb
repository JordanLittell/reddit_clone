class PostSub < ActiveRecord::Base

  validates :post_id, :sub_id, presence: true

  belongs_to(
    :post,
    class_name: 'Post',
    foreign_key: :post_id,
    primary_key: :id
  )
  
  belongs_to(
    :sub,
    class_name: 'Sub',
    foreign_key: :sub_id,
    primary_key: :id
  )
  
end

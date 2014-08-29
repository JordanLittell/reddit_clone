class Sub < ActiveRecord::Base
  validates :description, :title, presence: true
  belongs_to(
  :moderator,
  class_name: "User",
  foreign_key: :moderator_id,
  primary_key: :id
  )
  
  
  
end

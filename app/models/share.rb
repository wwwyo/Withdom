class Share < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :title,       presence: true
  validates :share_url,   presence: true
  validates :comment,     presence: true
  validates :category_id, presence: true


  belongs_to :user
  belongs_to :category

end

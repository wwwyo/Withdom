class Share < ApplicationRecord
  validates :share_url,   presence: true
  validates :title,       presence: true
  validates :comment,     presence: true
  validates :category_id, presence: true


  belongs_to :user

end

class Share < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :title,       presence: true
  validates :share_url,   presence: true
  validates :comment,     presence: true
  validates :category_id, presence: true


  belongs_to :user
  belongs_to :category

  private
  def self.check_path(id, path)
    if id
      shares = Share.includes(:user).where(category_id: id).order(created_at: :desc)
      path_id = path.split("/shares?id=").last
    else
      shares = Share.includes(:user).order(created_at: :desc)
      path_id = nil
    end
    return [shares, path_id]
  end
end

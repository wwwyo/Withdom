class Share < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user

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

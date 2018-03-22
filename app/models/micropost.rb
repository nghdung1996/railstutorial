class Micropost < ApplicationRecord
  belongs_to :user

  scope :order_desc, ->{order(created_at: :desc)}

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.content.maximum}
  validate :picture_size

  private

  def picture_size
    return errors.add :picture, t("limit_img") if picture.size > 5.megabytes
  end

  def current_user? user
    self == user
  end
end

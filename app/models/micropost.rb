class Micropost < ApplicationRecord
  belongs_to :user

  scope :order_desc, ->{order(created_at: :desc)}
  scope :following_feed, (lambda do |user|
    following_ids = "SELECT followed_id FROM relationships
      WHERE follower_id = :user_id"
    where "user_id IN (#{following_ids}) OR user_id = :user_id",
      user_id: user.id
  end)

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

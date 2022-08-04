class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, length: {maximum: Settings.post_max}
  validates :image, content_type: {in: Settings.image_type,
                                   message: :wrong_format},
                    size: {less_than: Settings.image_max.megabytes,
                           message: :too_big}

  delegate :name, to: :user, prefix: true
  scope :latest, ->{order(created_at: :desc)}

  def display_image
    image.variant resize_to_limit: Settings.image_resize
  end
end

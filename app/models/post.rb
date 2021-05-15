class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorite_relationships, dependent: :destroy
  has_many :liked_by, through: :favorite_relationships, source: :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:1000}
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }

  def display_image
    image.variant(resize_to_limit: [400, 400])
  end
end

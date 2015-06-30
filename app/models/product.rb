class Product < ActiveRecord::Base
  default_scope { where(ended_at: nil) }

  has_attached_file :image, :styles => { :thumb => "100x100>" }

  belongs_to :user
  has_many :habits, inverse_of: :product, dependent: :destroy

  # Validate associations
  validates :user, presence: true

  # Validate attributes
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  # validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /Aimage/
  validates_attachment_file_name :image, :matches => [/jpe?g\Z/, /png\Z/]
end

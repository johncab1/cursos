class Video < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 200, minimum: 2}

  validate :validate_custom_title

  def validate_custom_title
      errors.add(:title, "No es posible usar ese titulo") if title == 'CodigoFacilito'
  end

end

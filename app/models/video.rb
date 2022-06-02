class Video < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 200, minimum: 2}

  validate :validate_custom_title

  before_save :send_notification
  after_save :send_mail, if: :has_description?

  private
  def send_notification
    puts "Nuevo video!!"
  end

  def send_mail
    puts "Enviar correo!!"
  end

  def has_description?
    !description.nil? && !description.empty?
  end

  def validate_custom_title
      errors.add(:title, "No es posible usar ese titulo") if title == 'CodigoFacilito'
  end

end

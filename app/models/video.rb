# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  duration    :integer
#  visible     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer          not null
#
class Video < ApplicationRecord

  belongs_to :course
  has_many :video_categories
  has_many :categories, -> { order('id desc') }, through: :video_categories, after_add: :new_category

  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 200, minimum: 2}

  validate :validate_custom_title

  before_save :send_notification
  after_save :send_mail, if: :has_description?
  after_update :show_title
  scope :has_duration, -> { where('duration >= ?', 0)}
  scope :has_description, -> { where.not(description: nil)}
  scope :has_description_duration, -> { has_description.has_duration }

  private
  def new_category(category)
    puts "Se añadio al video #{title} la categoria #{category.title}"
  end
  def show_title
    puts "nos encontramos en el metodo show_title"
  end
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

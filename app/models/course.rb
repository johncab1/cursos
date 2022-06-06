# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  published   :boolean          default(FALSE)
#  visible     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
  has_many :videos
  has_many :categories, through: :videos, source: :categories
  has_many :comments, as: :commentable

  def self.has_videos
    #joins(:videos).where(videos: {visible: true})
    joins("inner join videos on courses.id = videos.course_id")
      .where(videos: {visible: true})
  end

  def self.no_has_videos
    joins("left join videos on courses.id = videos.course_id")
      .where("videos.id is null")
  end
end

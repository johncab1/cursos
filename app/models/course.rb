# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  published   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  visible     :boolean          default(FALSE)
#  status      :integer          default(0)
#
class Course < ApplicationRecord
  has_many :videos
  has_many :categories, through: :videos, source: :categories
  has_many :comments, as: :commentable

  enum state: [:draft, :published]

  def self.has_videos
    #joins(:videos).where(videos: {visible: true})
    joins("inner join videos on courses.id = videos.course_id")
      .where(videos: {visible: true})
  end

  def duration
    videos.sum('videos.duration')
  end

  def self.has_videos_with_duration
    joins(:videos).where(videos: { visible: true }).where("videos.duration > ? ", 10).uniq
  end

  def self.no_has_videos
    joins("left join videos on courses.id = videos.course_id")
      .where("videos.id is null")
  end
end

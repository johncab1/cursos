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
end

class Project < ApplicationRecord
  after_initialize :set_defaults

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_projects, -> { where(subtitle: "Ruby on Rails") }

  def self.angular
    where(subtitle: "Angular")
  end

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
end

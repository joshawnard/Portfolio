class Project < ApplicationRecord
  has_many :technologies

  include Placeholder

  after_initialize :set_defaults

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_projects, -> { where(subtitle: "Ruby on Rails") }

  def self.angular
    where(subtitle: "Angular")
  end

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: 400, width: 600)
    self.thumb_image ||= Placeholder.image_generator(height: 200, width: 350)
  end
end

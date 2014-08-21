class Panel < ActiveRecord::Base
  belongs_to :user
  has_many :widgets
  validates :name, presence: true
end

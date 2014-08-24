class Widget < ActiveRecord::Base
  belongs_to :panel
  before_create :default_values

  private
    def default_values
      self.input ||= 0
    end
end

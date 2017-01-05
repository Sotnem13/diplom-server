class Emotion < ActiveRecord::Base

  belongs_to :photo

  validates :photo_id, :name, presence: true


end

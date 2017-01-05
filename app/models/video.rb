class Video < ActiveRecord::Base

  belongs_to :tester
  belongs_to :application

  validates :video_path, :application_id, :tester_id, presence: true

end

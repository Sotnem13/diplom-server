class Video < ActiveRecord::Base

  belongs_to :tester
  belongs_to :application

  has_many :emotions, dependent: :destroy

  validates :data, :application_id, :tester_id, presence: true

  accepts_nested_attributes_for :emotions, allow_destroy: true

end

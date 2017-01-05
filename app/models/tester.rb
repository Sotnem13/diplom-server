class Tester < ActiveRecord::Base

  belongs_to :application
  has_many :photos
  has_many :videos

  validates :name, :aplication_id, presence: true


end

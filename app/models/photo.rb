class Photo < ActiveRecord::Base


  has_many :emotions, dependent: :destroy
  belongs_to :imageable, polymorphic: true

  validates :image, :imageable_id, :imageable_type, presence: true


end


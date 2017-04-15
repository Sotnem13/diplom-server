class Photo < ActiveRecord::Base


  has_many :emotions, dependent: :destroy
  belongs_to :imageable, polymorphic: true

  validates :image, :imageable_id, :imageable_type, presence: true

  accepts_nested_attributes_for :emotions, allow_destroy: true

  def emojis
    data = emotions.map(&:name).join(' ')
    result = Emoji.replace_unicode_moji_with_images(data)
    result.tr!('"', "'")
    result
  end

end


class Photo < ActiveRecord::Base


  has_many :emotions, dependent: :destroy
  belongs_to :imageable, polymorphic: true

  validates :image, :imageable_id, :imageable_type, presence: true

  accepts_nested_attributes_for :emotions, allow_destroy: true

  def emojis
    index = Emoji::Index.new
    data = emotions.map(&:name)
    result = data.map do |e|
      ActionController::Base.helpers.image_tag(Emoji.image_url_for_unicode_moji(e))
    end.join(' ')
    result.tr!('"', "'")
    result
  end

end


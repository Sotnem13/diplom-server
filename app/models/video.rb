class Video < ActiveRecord::Base

  belongs_to :tester
  belongs_to :application

  has_many :emotions, dependent: :destroy

  validates :data, :application_id, :tester_id, presence: true

  accepts_nested_attributes_for :emotions, allow_destroy: true

  def emojis
    data = emotions.map(&:name)
    result = data.map do |e|
      image = Emoji.image_url_for_unicode_moji(e)
      asset_path = ActionController::Base.helpers.asset_path(image)
      ActionController::Base.helpers.image_tag(asset_path)
    end.join(' ')
    result.tr!('"', "'")
    result
  end

end

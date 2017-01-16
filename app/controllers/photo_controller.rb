class PhotoController < ApplicationController

  def show
    photo = Photo.find_by(id: params[:id])

    data = if photo.nil? || photo.image.nil?
      File.read( 'public/404.png' )
    else
      photo.image
    end

    send_data( data, type: 'image/png', disposition: 'inline')
  end

end

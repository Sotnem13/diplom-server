require 'dropbox_sdk'

class Api::V1::RecordController < ApplicationController


  # {
  #     user_name: "",
  #     app_name: "",
  #     app_desc: "",
  #     user_desc: "",
  #     data: {
  #         images: [
  #             {
  #                 data: "",
  #                 emotions: []
  #             }
  #         ],
  #         video: []
  #     }
  # }



  def create


    access_token = 'qc7CA2wpo-AAAAAAAAAAPluWoZgWI9IIh2D3AF_LHucTiDVh3qfQIRIaGex9NsnK'
    client = DropboxClient.new(access_token)

0
    record  = params[:record]

    app = Application.find_or_create_by(name: record[:app_name], description: record[:app_desc])
    user = Tester.find_or_create_by( application: app, name: record[:user_name], descriptions: record[:user_desc] )


    destroy_all_data(app,user)

    params[:data][:images].each do |image_data|
      photo = Photo.new
      emotions = image_data[:emotions]
      file_name = "/#{(Photo.last && Photo.last.id || 0) + 1}.png"
      client.put_file(file_name, Base64::decode64(image_data[:data]))
      file_info = client.shares( file_name )
      response = Net::HTTP.get_response URI(file_info['url'])
      url = response['location'] + '&raw=1'
      response = Net::HTTP.get_response URI(url)
      photo.image = response['location']
      photo.imageable = user
      # photo.application = app
      photo.save
      emotions.each do |e|
        Emotion.create(name: e,photo: photo)
      end
    end
    # params[:data][:videos].each do
    #
    # end


    puts "\n\n\n" + '#'*50 + "\n#{params}\n\n\n"
    render json: {
        message: 'ещё не запилино =)'
    }
  end

  private

  def destroy_all_data app,user
    Photo.where(imageable: user).destroy_all
  end

end



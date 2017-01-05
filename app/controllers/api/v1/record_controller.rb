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
    record  = params[:record]

    app = Application.find_or_create_by(name: record[:app_name], description: record[:app_desc])
    user = Tester.find_or_create_by( application: app, name: record[:user_name], descriptions: record[:user_desc] )


    destroy_all_data(app,user)

    # params[:data][:images].each do

    # File.open('image.png','w') do |f|
    #   f.write(   Base64::decode64 image_data )
    # end

    # end
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


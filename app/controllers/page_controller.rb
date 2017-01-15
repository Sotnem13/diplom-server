class PageController < ApplicationController

  before_action :check_auth, except: :login

  def index
    # @applications = [ {name: 'asd'}, {name: 'asd 2'} ]
    @applications = Application.all
  end

  def app_show
    @app = Application.find_by(id: params[:id])
  end

  def tester_show
    @tester = Tester.find_by(id: params[:id])
    @photos = @tester.photos
  end


  def login

    if params[:login] == 'admin' && params[:password] == 'admin'
      session[:logined] = true
      redirect_to root_path
    else
      redirect_to root_path, alert: 'Проверьте логин и пароль'
    end

  end

  private

  def check_auth
    render :login_form if session[:logined].nil?
  end

end

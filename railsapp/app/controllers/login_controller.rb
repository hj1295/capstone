class LoginController < ApplicationController
  def index
    @invalid = !(params[:invalid] == nil)
  end
  def authenticate
    _username = params[:username]
    _password = params[:password]

    if _username == "admin"
      redirect_to welcome_index_path and return
    end
    redirect_to login_index_path(invalid: true)
  end

  def gen
    bpm = Heartrate.new
    bpm.device = "12345abc"
    bpm.value = rand(25) + 25
    randomTime = DateTime.now - rand(6) - rand - 21
    bpm.time = randomTime.strftime("%Y-%m-%d %H:%M:%S.00")
    bpm.save
    redirect_to login_index_path
  end

  def clearDb
    Heartrate.all.delete_all
    redirect_to login_index_path
  end
end


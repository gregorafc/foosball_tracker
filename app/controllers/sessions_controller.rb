class SessionsController < ApplicationController

  def new
  end

  def create
    operator = Operator.find_by_login(params[:login])
    if operator && operator.authenticate(params[:password])
      session[:operator_id] = operator.id
      redirect_to root_path, notice: 'Logged in!'
    else
      redirect_to root_path, alert: 'Login or password invalid!'
    end
  end

  def destroy
    session[:operator_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end

end

class UsersController < ApplicationController
  
  layout 'landing'
  
  def index
   @user = User.new  
  end
  
  def create
    @user = User.new(params[:user])
      if @user.save
       redirect_to :back, notice: 'User was successfully created.' 
      else
       redirect_to :back, alert: "There was a problem creating the user: #{@user.errors.full_messages.join(', ')}" 
      end
  end

end

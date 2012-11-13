class PagesController < ApplicationController
  layout "main"

  def no_layout
  	render :layout => false
  end

 

end

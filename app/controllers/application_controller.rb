class ApplicationController < ActionController::Base

def show
  @list = List.find(params[:id])
end
  

end

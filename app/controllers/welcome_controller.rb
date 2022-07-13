class WelcomeController < ApplicationController
  def index
    # Setting cookies and session
    cookies[:curso] = "Curso de Ruby on Rais - Jackson Pires [Cookie]"
    session[:curso] = "Curso de Ruby on Rais - Jackson Pires [Session]"
    @nome = params[:nome]
    @curso = params[:curso]
  end
end

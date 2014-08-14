class AuthenticationController < ApplicationController
  def login
    render 'authentication/login'
  end

  def signup
    render 'authentication/signup'
  end
end

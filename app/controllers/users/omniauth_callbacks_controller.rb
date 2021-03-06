# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def facebook
    callback_from(:facebook)
  end

  def github
    callback_from(:github)
  end

  def google_oauth2
    callback_from(:google_oauth2)
  end

  def callback_from(provider)
    @user = User.find_or_create_from_auth_hash!(request.env['omniauth.auth'])
    flash.notice = "#{provider}アカウントでログインできました"
    sign_in_and_redirect @user
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

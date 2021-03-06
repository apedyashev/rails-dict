class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def home

  end

  def create
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to authentications_url, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end


  def twitter
    omni = request.env["omniauth.auth"]#.to_yaml
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication
      #user logged in using Twitter and there are authentication record for twitter

      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      #user logged in using Twitter and there are NO authentication record for twitter

      token         = omni['credentials'].token
      token_secret  = omni['credentials'].secret

      #authenticate currently logged user using twitter
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      #user is NEW

      user = User.new
      user.apply_omniauth(omni)


      if user.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)
      else
        raise user.errors.full_messages.to_sentence
        #session[:omniauth] = omni.except('extra')
        #redirect_to new_user_registration_path
      end
    end
  end



end

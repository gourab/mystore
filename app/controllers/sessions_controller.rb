# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  layout "application"


  # render new.rhtml
  def new
  end

  def create
    #    @user=User.all
    #    @user.status=true
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    #if user.status==true && user_type=="STORE"
    if user
      
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      #redirect_back_or_default('/', :notice => "Logged in successfully")
      if  user.login=="admin"
        redirect_to admin_index_path
      elsif user.user_type=="STORE" && user.login!="admin" && user.status!=true
        logout_killing_session!
        redirect_back_or_default('/login', :notice => "You must contact with administrator.")
      elsif user.user_type=="STORE" && user.login!="admin" && user.status==true
        redirect_to root_path
      else
        redirect_to stores_path
      end
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
    #    else
    #      flash[:notice]="You should contact with website owner. "
    #      render :action => 'new'
    #
    #    end
  end

  def destroy
    logout_killing_session!
    redirect_back_or_default('/login', :notice => "You have been logged out.")
  end

  protected
  # Track failed login attempts
  def note_failed_signin
    flash.now[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end

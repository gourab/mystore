class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
   # puts "User Type #{params[:user][:user_type]}"
   
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.user_type=params[:user][:user_type]
    success = @user && @user.save
    
    if success && @user.errors.empty?
      
      @user.create_store(params[:store])
       @store=Store.find(:first, :conditions => ["user_id =?", @user.id])
#       process_file_uploads(@store)
      @url_notification = url_for(:controller => 'users', :action => 'activate', :activation_code => @user.activation_code)
      UserMailer.signup_notification(@user, @url_notification).deliver
      redirect_back_or_default('/login', :notice => "Thanks for signing up!  We're sending you an email with your activation code.")
    else
      
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render  'stores/new' #:action => 'new'
     #render :controller => StoreController, :action => "new"
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      redirect_to '/login', :notice => "Signup complete! Please sign in to continue."
    when params[:activation_code].blank?
      redirect_back_or_default('/', :flash => { :error => "The activation code was missing.  Please follow the URL from your email." })
    else 
      redirect_back_or_default('/', :flash => { :error  => "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in." })
    end
  end

   protected

  def process_file_uploads(store)   
    i = 0
    while params['file_'+i.to_s] != "" && !params['file_'+i.to_s].nil?
      store.assets.create(:data => params['file_'+i.to_s])
      i += 1
    end
    
  end

end

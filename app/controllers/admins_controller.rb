class AdminsController < ApplicationController
  layout "admin"
  before_filter :login_required
  def index
    @stores=Store.all
  end
  def active
    @user=User.find(params[:id])
    if @user.update_attribute(:status , true)
      redirect_to admin_index_path
    end
  end
  def inactive
    @user=User.find(params[:id])
    if @user.update_attribute(:status ,false)
      redirect_to admin_index_path
    end
  end

  
end

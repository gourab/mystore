class StoresController < ApplicationController
  
  def index
    @stores=Store.all
  end

  def home
    @items=Item.all
  end

  def show_item
    @item=Item.find(params[:id])
  end

  def show_store_item
    
    @items=Item.find(:all , :conditions => ["store_id =?", params[:id]])
    @store=Store.find(params[:id])
  end

  def add_to_cart
    item_hash = "item_#{params[:item_id]}".to_sym
    if session[:cart].blank?
      cart = []
      cart << params[item_hash]
      session[:cart] = cart
    else
      a = false
      session[:cart].each do |p|
        if p[:item_id] == params[:item_id]
          p[:quantity] = p[:quantity].to_i + params[item_hash][:quantity].to_i
          a = true
        end
      end
      if a == false
        session[:cart] << params[item_hash]
      end
    end
    redirect_to show_cart_path
  end

  def show_cart
    @cart = session[:cart]
    #    create_address if params[:order]
  end

  def remove_cart
    @cart = session[:cart]
    @cart.each do |p|
      if p[:item_id] == params[:id]
        p[:quantity]= nil
      end
    end
    redirect_to show_cart_path
  end

  def empty_cart
    session[:cart]=nil
    redirect_to root_path
  end

  def update_cart
    @cart = session[:cart]
    @cart.each do |p|
      if p[:item_id] == params[:cart][:id]
        p[:quantity]= params[:cart][:quantity]
      end
    end
    redirect_to show_cart_path
  end

  def new_address
    @order = Order.new
  end

  def paypal
    @order = Order.new(params[:order])
    @cart = session[:cart]
    $shipping = 0
    @cart.each do |cr|
      $shipping = $shipping.to_i + cr[:quantity].to_i
      item = Item.find_by_id(cr[:item_id])
      @order.price = $sum.to_f
      @order.net_price = @order.price.to_i
      @order.lineitems.build({:item_id=>cr[:item_id],:quantity=>cr[:quantity],:price=>item.price})
      
    end
    
    if @order.valid?
      @order.price = $sum.to_f
      @order.save
      redirect_to indexpaypal_path(:id => @order.id)
    else
      render :action => "new_address"
    end  

  end

  def indexpaypal
    session[:cart] = nil
    @order = Order.find(params[:id])
    @return_url = url_for(:controller => :stores, :action => :payment_status)
    @cancel_url = url_for(:controller => :stores, :action => :indexpaypal, :id => @order.id)
  end

  def payment_status
    #puts"payment DAte#{Time.parse(params[:payment_date]) }"
    if params[:payment_status] == "Completed"
      lineitem = Lineitem.find_by_item_no(params[:item_number1])
      lineitem.order.update_attributes(:transaction_id => params[:txn_id], :payment_at =>params[:payment_date] , :payment_status => true)
      redirect_to payment_success_path
    else
      redirect_to payment_error_path
    end
  end

  def all_charity
    # @charities=Store.find(:all , :conditions => ["store_type=?","charity"])
    @charities=Store.find_by_sql("Select * from stores,users where stores.user_id=users.id and users.status=1 and stores.store_type='charity'")
  end

  def all_club
    #    @clubs=Store.find(:all , :conditions => ["store_type=?","club"])
    @clubs=Store.find_by_sql("Select * from stores,users where stores.user_id=users.id and users.status=1 and stores.store_type='club'")
  end

end

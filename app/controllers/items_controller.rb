class ItemsController < ApplicationController
  
  def new
    @item=Item.new
  end
  def index
    @items=Item.all
  end

  def show
    @item=Item.find(params[:id])
  end

  def create
    @store=Store.find(:first, :conditions => ["user_id =?", current_user.id])
    @item = Item.new(params[:item])
    @item.store_id=@store.id
   
    respond_to do |format|
      if @item.save
        process_file_uploads(@item)
        format.html { redirect_to(items_path, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  protected

  def process_file_uploads(item)
    i = 0
    while params['file_'+i.to_s] != "" && !params['file_'+i.to_s].nil?
      item.assets.create(:data => params['file_'+i.to_s])
      i += 1
    end
  end
end

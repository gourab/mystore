class AssetsController < ApplicationController
   def show
    asset = Asset.find(params[:id])
    # do security check here
    send_file asset.data.path, :type => asset.data_content_type
  end

   def destroy
    asset = Asset.find(params[:id])
    @asset_id = asset.id.to_s
    @allowed = Item::Max_Attachments - asset.attachable.assets.count
    asset.destroy
     redirect_to :back

  end
end

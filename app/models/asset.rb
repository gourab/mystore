class Asset < ActiveRecord::Base
  has_attached_file  :data,
    :styles => { :medium => "250x250>", :thumb => "200x200>" }
#    :url => "/assets/:id/:style"
  #                    :path => ":rails_root/assets/docs/:id/:style/:basename.:extension"


  belongs_to :attachable, :polymorphic => true

  def url(*args)
    data.url(*args)
  end

  def name
    data_file_name
  end

  def content_type
    data_content_type
  end

  def file_size
    data_file_size
  end
end

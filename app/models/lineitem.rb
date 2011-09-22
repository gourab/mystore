class Lineitem < ActiveRecord::Base
   belongs_to :item
   belongs_to :order

  before_create :set_item_no

  protected
  def set_item_no
    self.item_no = generate_item_no { |item_no| self.class.find_by_item_no(item_no).nil? }
  end

  def generate_item_no(size = 16, &validity)
    begin
      item_no = ActiveSupport::SecureRandom.hex(64).first(size)
    end while !validity.call(item_no) if block_given?
    item_no
  end
end

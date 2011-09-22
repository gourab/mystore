class Order < ActiveRecord::Base
  has_many :lineitems, :dependent => :delete_all
  before_create :set_order_no
  validates_presence_of  :first_name, :last_name, :email, :message => "can't be blank."
  validate :shipping_address

  protected
  def shipping_address
    if self.shipping == 'yes'
      self.errors.add(:zip_code, "can't be blank.") if self.zip_code.blank?
      self.errors.add(:state, "can't be blank.") if self.state.blank?
      self.errors.add(:address1, "can't be blank.") if self.address1.blank?
    end
  end
  def set_order_no
    self.order_no = generate_order_no { |order_no| self.class.find_by_order_no(order_no).nil? }
  end

  def generate_order_no(size = 16, &validity)
    begin
      order_no = ActiveSupport::SecureRandom.hex(64).first(size)
    end while !validity.call(order_no) if block_given?
    order_no
  end
end

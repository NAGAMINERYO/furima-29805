class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  # validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :price, format: { with: /\A[0-9]+\z/}
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 } 
  validates :shipment_source_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 }
  # with_options presence: true do
  #   validates :name
  #   validates :status
  #   validates :delivery_charge
  #   validates :shipment_source
  #   validates :shipping_day
  #   validates :price
  # end

  # with_options numericality: { other_than: 1 } do
  #   validates :status
  #   validates :delivery_charge
  #   validates :shipment_source
  #   validates :shipping_day
  # end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipping_day
  


  

end
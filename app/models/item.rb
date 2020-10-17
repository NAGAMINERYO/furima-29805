class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :price
    validates :status_id
    validates :delivery_charge_id
    validates :shipment_source_id
    validates :shipping_day_id
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 } 
  validates :shipment_source_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]+\z/}
  validates :price, numericality: { greater_than: 300, less_than: 9999999 }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipping_day
  
end
class OrderPurchaser 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefectures, :municipality, :address ,:building, :phone_number, :purchaser_id, :token
  
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :postal_code, presence: true
  validates :prefectures, presence: true
  validates :municipality, presence: true
  validates :address , presence: true
  validates :phone_number, presence: true
  validates :token, presence: true

  



  def save
    Purchaser.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, prefectures: prefectures, municipality: municipality, address: address, building: building, phone_number: phone_number, purchaser_id: purchaser_id )
   
  end
end
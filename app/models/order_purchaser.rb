class OrderPurchaser 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefectures, :municipality, :address ,:building, :phone_number, :purchaser_id, :token
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code
    validates :prefectures
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{11}\z/}
  validates :prefectures, numericality: { other_than: 1 }


  def save
    Purchaser.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, prefectures: prefectures, municipality: municipality, address: address, building: building, phone_number: phone_number, purchaser_id: purchaser_id )
   
  end
end
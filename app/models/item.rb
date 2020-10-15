class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  validates :image, presence: true
  # validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  #空の投稿を保存できないようにする
  validates :category_id, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :status
  #空の投稿を保存できないようにする
  validates :status_id, presence: true
  #状態の選択が「--」の時は保存できないようにする
  validates :status_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :delivery_charge
  #空の投稿を保存できないようにする
  validates :delivery_charge_id, presence: true
  #配送料の負担の選択が「--」の時は保存できないようにする
  validates :delivery_charge_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :shipment_source
  #空の投稿を保存できないようにする
  validates :shipment_source_id, presence: true
  #配送元の地域の選択が「--」の時は保存できないようにする
  validates :shipment_source_id, numericality: { other_than: 1 } 

  belongs_to_active_hash :shipping_day
  #空の投稿を保存できないようにする
  validates :shipping_day_id, presence: true
  #配送元の地域の選択が「--」の時は保存できないようにする
  validates :shipping_day_id, numericality: { other_than: 1 } 

end
class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code    ,null: false   #郵便番号
      t.string :prefectures    ,null: false   #都道府県
      t.string :municipality   ,null: false   #市区町村
      t.string :address        ,null: false   #番地
      t.string :building       ,null: false   #建物名
      t.string :phone_number   ,null: false   #電話番号
      t.references :purchaser  ,null: false, foreign_key: true
      t.timestamps
      
    end
  end
end

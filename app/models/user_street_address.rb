class UserStreetAddress
  include ActiveModel::Model
  attr_accessor :token, :postal, :area_id, :municipality, :address, :building_name, :phone_number, :user_id, :furima_id

  with_options presence: true do
    validates :token
    validates :postal,         format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality
    validates :address
    validates :phone_number,    format: { with: /\A\d{10,11}\z/ }
  end

  validates :area_id,        numericality: { other_than: 0, message: "can't be blank" }
  def save

    purchase =  Purchase.create(user_id: user_id, furima_id: furima_id)
    StreetAddress.create(postal: postal, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, area_id: area_id, purchase_id: purchase.id)
  end
end
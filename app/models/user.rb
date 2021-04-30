class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :furimas
  has_many :purchases

  # belongs_to :nick_name
  # belongs_to :name_chinese_character_last_name
  # belongs_to :name_chinese_character_first_name
  # belongs_to :name_catakana_last_name
  # belongs_to :name_catakana_first_name
  # belongs_to :birthday
  # belongs_to :email
  # belongs_to :encrypted_password
end

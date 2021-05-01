class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :furimas
  has_many :purchases


  validates :nick_name,                             presence: true

  with_options presence: true, format: { with: /\A[ぁ-ん一-龥々ー]+\z/ } do
  validates :name_chinese_character_last_name      
  validates :name_chinese_character_first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do     
  validates :name_catakana_last_name              
  validates :name_catakana_first_name
  end

  validates :birthday,                              presence: true
  validates :email,                                 presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  # belongs_to :nick_name
  # belongs_to :name_chinese_character_last_name
  # belongs_to :name_chinese_character_first_name
  # belongs_to :name_catakana_last_name
  # belongs_to :name_catakana_first_name
  # belongs_to :birthday
  # belongs_to :email
  # belongs_to :encrypted_password
end

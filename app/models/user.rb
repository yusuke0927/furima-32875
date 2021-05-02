class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :furimas
  #has_many :purchases


  validates :nick_name,                             presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
  validates :name_chinese_character_last_name      
  validates :name_chinese_character_first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do     
  validates :name_catakana_last_name              
  validates :name_catakana_first_name
  end

  validates :birthday,                              presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # カートができたらhas_manyする！ 
  # has_many :carts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :last_name_roman, presence: true, length: { minimum:1, maximum:20 }
  validates :first_name_roman, presence: true, length: { minimum:1, maximum:20 }
  validates :last_name, presence: true, length: { minimum:1, maximum:20 }
  validates :first_name, presence: true, length: { minimum:1, maximum:20 }
  validates :birth_date, presence: true
  validates :sex, presence: true

  # attachment :profile_image

end

class Product < ApplicationRecord
    
    has_many :favorites, dependent: :destroy
    # belongs_to :user, optional: true
    belongs_to :producer
    belongs_to :category
    

    validates :name, presence: true
    validates :price, presence: true
    validates :explanation, presence: true, length: { minimum:10, maximum:200 }
    validates :stock, presence: true
    validates :category_id, presence: true
    validates :producer_id, presence: true

    attachment :product_image

    # favoritesでそのユーザによっていいねがされているか判別する
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

end

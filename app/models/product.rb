class Product < ApplicationRecord

    belongs_to :user, optional: true

    validates :name, presence: true
    validates :price, presence: true
    validates :explanation, presence: true, length: { minimum:10, maximum:200 }
    validates :stock, presence: true

    attachment :product_image
    
end

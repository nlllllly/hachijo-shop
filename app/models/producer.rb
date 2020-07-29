class Producer < ApplicationRecord
    has_many :products, dependent: :destroy

    validates :producer_name, presence: true
    validates :explanation, presence: false
    validates :url, presence: false

    attachment :producer_image
end

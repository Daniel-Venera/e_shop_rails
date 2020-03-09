class Item < ApplicationRecord
    validates :title, 
    presence: true
    validates_length_of :title,
    minimum: 5


    validates :description, 
    presence: true
    validates_length_of :description,
    minimum: 10
    
    validates :price, 
    presence: true,
    numericality: {greater_than_or_equal_to: 5}

    validates :image_url, 
    presence: true

    
    

end

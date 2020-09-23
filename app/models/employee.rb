class Employee < ApplicationRecord
    validates :alias, :title, uniqueness: true

    belongs_to :dog
    
end

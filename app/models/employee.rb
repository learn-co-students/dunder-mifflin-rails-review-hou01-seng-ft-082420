class Employee < ApplicationRecord
    belongs_to :dog
<<<<<<< HEAD
   
    validates :alias, :title, uniqueness: true
=======
>>>>>>> 862afd2750da96d1fe654aaf16df8394495dbf61
end

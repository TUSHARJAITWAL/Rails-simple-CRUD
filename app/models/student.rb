class Student < ApplicationRecord
    validates :first_name,:last_name,:email,:address,:college,presence: :true
end

class User < ApplicationRecord
    validates :first_name, :last_name, presence: true
    validates :first_name, format: { with: %r{\A[a-zA-Z]+\z}  }
    validates :last_name, format: { with: %r{\A[a-zA-Z]+\z}  }
    validates :email, presence: true 
    validates :email, uniqueness: true
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  end
  
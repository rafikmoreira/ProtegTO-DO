class User < ApplicationRecord
  has_secure_password
  has_many :tarefas, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :nome, presence: true
end

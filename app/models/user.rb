class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bills, dependent: :destroy
  has_many :transactions, dependent: :destroy
  belongs_to :flat, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

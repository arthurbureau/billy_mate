class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, PhotoUploader

  has_many :bills, dependent: :destroy
  has_many :transactions, dependent: :destroy
  belongs_to :flat, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :avatar, presence: true
  validates :phone_number, presence: true, uniqueness: true
  # validates :phone_number, format: { with: / \A(\+33 6|0[1-9]((\s|\W|)\d{2}){4}$)\z/, message: "wrong format for phone_number" }

  attr_accessor :token

  def to_s
    first_name
  end

  def lydia_md5_encode
    user_infos = {
      email: email,
      firstname: first_name,
      lastname: last_name,
      mobilenumber: phone_number
    }
    arr = []
    user_infos.each do |key, value|
      arr << "#{key}=#{value}"
    end
    Digest::MD5.hexdigest arr.join('&')
  end

end

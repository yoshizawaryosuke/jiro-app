class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :stores

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :noodle
  belongs_to :soup
  belongs_to :meat
  belongs_to :vegetable
  belongs_to :garlic
  belongs_to :oil

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :noodle_id
      validates :soup_id
      validates :meat_id
      validates :vegetable_id
      validates :garlic_id
      validates :oil_id
    end
  end
       
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
       
end

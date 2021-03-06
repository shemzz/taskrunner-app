class Professional < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :services
  has_and_belongs_to_many :areas
  has_and_belongs_to_many :block_times
	has_secure_password
	validates :email, presence: true, uniqueness: true

  has_many :requests, dependent: :destroy
  has_many :users, through: :requests

  def self.authenticate(params)
    Professional.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

end

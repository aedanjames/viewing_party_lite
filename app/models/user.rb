class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :name, :email, :password_digest, presence: true


  validates_uniqueness_of :email
  has_secure_password

  has_one_attached :avatar

  def is_host
    parties.where(host_id: id)
  end 

  def invitations
    parties.where.not(host_id: id)
  end
end

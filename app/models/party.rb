class Party < ApplicationRecord
  has_many :user_parties, dependent: :destroy
  has_many :users, through: :user_parties

  validates :start_date, :start_time, :duration, :movie_id, :host_id, presence: true

  validates :duration, :movie_id, :host_id, numericality: { greater_than: 0 }

  def find_host
    users.find(host_id).name
  end
end

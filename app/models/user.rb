class User < ApplicationRecord
  include PgSearch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #after_create :send_welcome_email

  has_many :participations
  has_many :games, through: :participations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader

  pg_search_scope :search_by_first_name_and_last_name,
                  against: [:first_name, :last_name],
                  using: {
                    tsearch: { prefix: true }
                  }

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now #   UserMailer.welcome(self).deliver_now
  end
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # devise :database_authenticatable,
  #        :jwt_authenticatable,
  #        :registerable,
  #        jwt_revocation_strategy: JwtDenylist

  scope :paid, -> { where(role: :paid)}
  scope :unpaid, -> { where(role: :unpaid)}
  scope :admin, -> { where(role: :admin)}
end
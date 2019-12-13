class Admin < ApplicationRecord
  has_secure_password

  attr_accessor :skip_password_validation

  enum role: {
    low: 0,
    hight: 1
  }

  validates :password, presence: true, confirmation: true, length: { within: 6..40 }, unless: :skip_password_validation
  validates :first_name, :last_name, presence: true
  validates :login, presence: true, format: { with: %r(\A[a-zA-Z_]+\z) }


  def full_name
    [first_name, last_name].join(' ').strip
  end
end

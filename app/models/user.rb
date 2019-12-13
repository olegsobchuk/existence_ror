class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, last_name].join(' ').strip
  end
end

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  class << self
    def grouped_by_rank
      all.group_by(&:level)
    end
  end

  def full_name
    [first_name, last_name].join(' ').strip
  end
end

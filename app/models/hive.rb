class Hive < ActiveRecord::Base
  belongs_to :user
  has_many :inspections

  validates :nickname, :location, presence: true


  def hive_owner user
    user && user.id == self.user.id
  end
end

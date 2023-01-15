class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Товарищ №#{rand(100)}" if self.name.blank?
  end
end

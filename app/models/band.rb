class Band < ApplicationRecord
  has_many :band_memberships, dependent: :destroy
  has_many :users, through: :band_memberships
  validates :band_name, presence: true
  INSTRUMENTS = ["ボーカル", "ギター", "ギターボーカル", "ベースボーカル", "ベース", "キーボード", "ドラム"].freeze
end

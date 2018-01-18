class Survivor < ApplicationRecord
  belongs_to :inventory, dependent: :destroy
  has_many :suspects
end

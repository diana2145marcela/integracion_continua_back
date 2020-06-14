class Gasto < ApplicationRecord
  validates :nombre, presence: true,
                     length: { minimum: 2, maximum: 255 }
  validates :fecha, presence: true
  validates :monto, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }

  belongs_to :usuario
end

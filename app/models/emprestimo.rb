class Emprestimo < ApplicationRecord
  belongs_to :user
  has_one :carro
end

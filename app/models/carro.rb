class Carro < ApplicationRecord
  paginates_per 10
  belongs_to :emprestimo
end
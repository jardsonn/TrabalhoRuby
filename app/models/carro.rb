class Carro < ApplicationRecord
  paginates_per 2
  belongs_to :emprestimo
end
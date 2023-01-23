class Carro < ApplicationRecord
  paginates_per 6
  #belongs_to :emprestimo
end
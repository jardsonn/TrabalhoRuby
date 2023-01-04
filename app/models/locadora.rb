class Locadora < ApplicationRecord
  belongs_to :carro
  belongs_to :locatario
end

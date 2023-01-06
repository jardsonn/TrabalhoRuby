json.extract! carro, :id, :modelo, :marca, :valor_aluguel, :placa, :imagemUrl, :created_at, :updated_at
json.url carro_url(carro, format: :json)

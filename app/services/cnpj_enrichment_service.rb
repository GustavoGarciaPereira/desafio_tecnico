require 'httparty'

class CnpjEnrichmentService
  API_URL = 'https://api-publica.speedio.com.br/buscarcnpj?cnpj='

  def self.enrich(cnpj)
    puts "Chamando a API para o CNPJ: #{cnpj}"
    response = HTTParty.get("#{API_URL}#{cnpj}")
    puts "Resposta da API: #{response.body}"

    if response.success?
      data = JSON.parse(response.body)
      puts "Dados recebidos: #{data.inspect}"
      puts "Nome Fantasia: #{data['RAZAO SOCIAL']}"
      {
        name: data['RAZAO SOCIAL'],
        status: data['STATUS'],
        cep: data['CEP'],
        ddd: data['DDD'],
        telefone: data['TELEFONE'],
        municipio: data['MUNICIPIO'],
        uf: data['UF'],
        email: data['EMAIL']
      }
    else
      puts "Erro ao chamar a API: #{response.code} - #{response.message}"
      nil
    end
  end
end
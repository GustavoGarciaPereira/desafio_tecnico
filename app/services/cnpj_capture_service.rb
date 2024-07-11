# app/services/cnpj_capture_service.rb
class CnpjCaptureService
  BASE_URL = 'https://www.idinheiro.com.br/investimentos/cnpj-empresas-listadas-b3/'

  def self.capture_cnpjs
    cnpjs = []

    10.times do |i|
      response = HTTParty.get("#{BASE_URL}?q=#{i}")
      parsed_page = Nokogiri::HTML(response.body)

      # Ajustando o seletor para capturar os CNPJs dentro de <span>
      parsed_page.css('table.content-post__block__table--striped tbody tr td span, table.content-post__block__table--striped tbody tr td').each do |span|
        if span.text.strip =~ /^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/
          formatted_cnpj = span.text.strip.gsub(/[\.\-\/]/, '')
          cnpjs << formatted_cnpj
        end
      end
    end

    unique_cnpjs = cnpjs.uniq.first(500)
    
    # Salvar os CNPJs no MongoDB
    unique_cnpjs.each do |cnpj|
      Cnpj.create(value_cnpj: cnpj)
    end

    unique_cnpjs
  end
end

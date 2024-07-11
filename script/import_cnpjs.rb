# script/import_cnpjs.rb
  require 'mongoid'
  require 'elasticsearch'
  require 'elasticsearch/model'
  
  # Configuração do cliente Elasticsearch
# Configuração do cliente Elasticsearch
    config = {
    host: "localhost",
    port: "9200",
    transport_options: {
        request: { timeout: 5 }
    },
    log: true
    }

    Elasticsearch::Model.client = Elasticsearch::Client.new(config)
  
  # Configuração do Mongoid
  Mongoid.load!('config/mongoid.yml', :development)
  
  # Definição do modelo Mongoid
  class MyDocument
    include Mongoid::Document
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
  
    # Define o índice no Elasticsearch
    index_name "cnpjs_#{Rails.env}" if defined?(Rails) && Rails.respond_to?(:env)
  
    # Mapeamento dos campos que serão indexados
    settings do
      mappings dynamic: false do
        indexes :value_cnpj, type: 'text'
        indexes :name, type: 'text'
        indexes :status, type: 'text'
        indexes :cep, type: 'text'
        indexes :ddd, type: 'text'
        indexes :telefone, type: 'text'
        indexes :municipio, type: 'text'
        indexes :uf, type: 'text'
        indexes :email, type: 'text'
        # Adicione outros campos conforme necessário
      end
    end
  
    # Método para definir os campos a serem indexados
    def as_indexed_json(options={})
      {
        value_cnpj: self.value_cnpj,
        name: self.name,
        status: self.status,
        cep: self.cep,
        ddd: self.ddd,
        telefone: self.telefone,
        municipio: self.municipio,
        uf: self.uf,
        email: self.email
        # Adicione outros campos conforme necessário
      }
    end
  end
  
  # Iteração pelos documentos do Mongoid e indexação no Elasticsearch
  MyDocument.all.each do |document|
    document.__elasticsearch__.index_document
  end
  
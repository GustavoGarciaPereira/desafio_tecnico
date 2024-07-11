class Cnpj < ApplicationRecord
end
class Cnpj < ApplicationRecord
  include Mongoid::Document
  field :value_cnpj, type: String
  field :name, type: String
  field :status, type: String
  field :cep, type: String
  field :ddd, type: String
  field :telefone, type: String
  field :municipio, type: String
  field :uf, type: String
  field :email, type: String
  field :website, type: String
  field :linkedin, type: String
  field :google_maps_phone, type: String
end

  
# class Cnpj < ApplicationRecord
#   include Mongoid::Document
#   include Elasticsearch::Model
#   include Elasticsearch::Model::Callbacks

#   # Definição dos campos
#   field :value_cnpj, type: String
#   field :name, type: String
#   field :status, type: String
#   field :cep, type: String
#   field :ddd, type: String
#   field :telefone, type: String
#   field :municipio, type: String
#   field :uf, type: String
#   field :email, type: String

#   # Indexação no Elasticsearch
#   index_name "cnpjs_#{Rails.env}"

#   # Mapeamento dos campos no Elasticsearch
#   mapping do
#     indexes :value_cnpj, type: :text
#     indexes :name, type: :text
#     indexes :status, type: :text
#     indexes :cep, type: :text
#     indexes :ddd, type: :text
#     indexes :telefone, type: :text
#     indexes :municipio, type: :text
#     indexes :uf, type: :text
#     indexes :email, type: :text
#   end
#   # Métodos para definir os campos a serem indexados
#   def as_indexed_json(options={})
#     self.as_json(only: [:name])
#   end
#   # Método para converter o objeto em um hash adequado para o Elasticsearch
#   def as_document
#     {
#       value_cnpj: self.value_cnpj,
#       name: self.name,
#       status: self.status,
#       cep: self.cep,
#       ddd: self.ddd,
#       telefone: self.telefone,
#       municipio: self.municipio,
#       uf: self.uf,
#       email: self.email
#       # Adicione outros campos conforme necessário
#     }
#   end
# end

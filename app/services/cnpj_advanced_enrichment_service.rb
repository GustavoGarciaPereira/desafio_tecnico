# app/services/cnpj_advanced_enrichment_service.rb
require 'httparty'
require 'nokogiri'

class CnpjAdvancedEnrichmentService
  include HTTParty

  base_uri 'https://api.example.com'

  def self.enrich(value_cnpj)
    cnpj = Cnpj.find_by(value_cnpj: value_cnpj)
    return nil unless cnpj

    {
      website: fetch_website(value_cnpj),
      linkedin: fetch_linkedin(value_cnpj),
      google_maps_phone: fetch_google_maps_phone(value_cnpj)
    }
  end

  def self.fetch_website(value_cnpj)
    "https://www.fetch_website.com/#{value_cnpj}"
  end

  def self.fetch_linkedin(value_cnpj)
    "https://www.fetch_linkedin.com/#{value_cnpj}"
  end

  def self.fetch_google_maps_phone(value_cnpj)
    "https://www.fetch_google_maps_phone.com/#{value_cnpj}"
  end
end

namespace :cnpjs do
  desc "Enriquece CNPJs com informações avançadas"
  task enrich_advanced: :environment do
    Cnpj.all.each do |cnpj|
      puts "#{cnpj.value_cnpj}"
      advanced_details = CnpjAdvancedEnrichmentService.enrich(cnpj.value_cnpj)
      if advanced_details
        cnpj.update(advanced_details)
        puts "Enriched CNPJ #{cnpj.value_cnpj} with advanced details."
      else
        puts "CNPJ #{cnpj.value_cnpj} not found or error during enrichment."
      end
    end
  end
end
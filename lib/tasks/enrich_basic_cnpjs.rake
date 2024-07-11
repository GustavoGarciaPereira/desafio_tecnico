namespace :cnpjs do
    desc "Enriquece CNPJs com informações básicas"
    task enrich_basic: :environment do
      Cnpj.all.each do |cnpj|
        puts "#{cnpj.value_cnpj}"
        details = CnpjEnrichmentService.enrich(cnpj.value_cnpj)
        cnpj.update(details)
        puts "Enriched CNPJ #{cnpj.value_cnpj} with basic details."
      end
    end
  end
  
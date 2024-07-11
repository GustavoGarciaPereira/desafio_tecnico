# lib/tasks/capture_cnpjs.rake
namespace :cnpjs do
    desc "Captura CNPJs de páginas"
    task capture: :environment do
      cnpjs = CnpjCaptureService.capture_cnpjs
      puts cnpjs
    end
  end
  
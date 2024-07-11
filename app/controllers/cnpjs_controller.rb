class ApplicationController < ActionController::Base
end

# app/controllers/cnpjs_controller.rb
class CnpjsController < ApplicationController
  def search
    if params[:name].present?
      @cnpjs = Cnpj.where(name: /#{params[:name]}/i)
    else
      @cnpjs = Cnpj.all
    end
    render json: @cnpjs
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
end
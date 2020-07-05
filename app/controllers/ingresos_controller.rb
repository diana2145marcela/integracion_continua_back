class IngresosController < ApplicationController
  before_action :set_ingreso, only: [:show, :update, :destroy]

  # GET /ingresos
  def index
    @ingresos = Ingreso.all

    render json: @ingresos
  end

  # GET /ingresos/1
  def show
    render json: @ingreso
  end

  # POST /ingresos
  def create
    @ingreso = Ingreso.new(ingreso_params)

    if @ingreso.save
      render json: @ingreso, status: :created, location: @ingreso
    else
      render json: @ingreso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingresos/1
  def update
    if @ingreso.update(ingreso_params)
      render json: @ingreso
    else
      render json: @ingreso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ingresos/1
  def destroy
    @ingreso.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingreso
      @ingreso = Ingreso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingreso_params
      params.fetch(:ingreso, {})
    end
end

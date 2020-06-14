class GastosController < ApplicationController
  before_action :set_gasto, only: [:show, :update, :destroy]

  # GET /gastos
  def index
    @gastos = Gasto.all

    render json: @gastos
  end

  # GET /gastos/1
  def show
    render json: @gasto
  end

  # POST /gastos
  def create
    @gasto = Gasto.new(gasto_params)
    @gasto.usuario = current_user

    if @gasto.save
      render json: @gasto, status: :created, location: @gasto
    else
      render json: @gasto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gastos/1
  def update
    if @gasto.update(gasto_params)
      render json: @gasto
    else
      render json: @gasto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gastos/1
  def destroy
    @gasto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasto
      @gasto = Gasto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gasto_params
      params.require(:gasto).permit(:nombre, :fecha, :monto)
    end
end

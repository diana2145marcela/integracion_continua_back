class UsuariosController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    valid_params = usuario_params
    @usuario = Usuario.new(valid_params)
    if @usuario.save
      command = AuthenticateUser.call(valid_params[:correo_electronico], valid_params[:password])
      render json: { auth_token: command.result, usuario: @usuario },
             status: :created, location: usuario_url(@usuario.id)
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :correo_electronico, :password,
                                    :password_confirmation)
  end
end

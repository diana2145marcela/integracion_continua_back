class AuthenticateUser
  prepend SimpleCommand

  def initialize(correo_electronico, password)
    @correo_electronico = correo_electronico
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: usuario.id) if usuario
  end

  private

  attr_accessor :correo_electronico, :password

  def usuario
    usuario = Usuario.find_by(correo_electronico)
    return usuario if usuario && usuario.authenticate(password)

    errors.add :user_authentication, 'Credenciales no válidas'
    nil
  end
end

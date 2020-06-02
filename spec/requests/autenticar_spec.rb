require 'rails_helper'

RSpec.describe 'Autenticación de usuario' do
  context 'cuando el usuario existe en la base de datos' do
    it 'devuelve el token correspondiente al usuario' do
      Usuario.create(nombre: 'Usuario',
                     correo_electronico: 'user@example.com',
                     password: 'secret',
                     password_confirmation: 'secret')
      post '/autenticar', params: { correo_electronico: 'user@example.com',
                                    password: 'secret' }
      json = JSON.parse(response.body)
      expect(json).to include('auth_token')
    end
  end

  context 'cuando el usuario no existe en la base de datos' do
    it 'devuelve un http status de unauthorized' do
      post '/autenticar', params: { correo_electronico: 'user@example.com',
                                    password: 'secret' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
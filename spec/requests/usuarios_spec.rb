require 'rails_helper'

RSpec.describe 'Creación de usuarios', type: :request do
  context 'datos válidos' do
    before do
      post '/usuarios', params: { usuario: { nombre: 'Usuario',
                                             correo_electronico: 'correo@ejemplo.com',
                                             password: 'secret',
                                             password_confirmation: 'secret' } }
    end

    let(:json) { JSON.parse(response.body) }

    it 'incluye el token de autenticación cuando se registra un nuevo usuario' do
      expect(json).to include('auth_token')
    end

    it 'incluye el usuario recién creado' do
      expect(json).to include('usuario')
    end
  end

  context 'datos no válidos' do
    before do
      post '/usuarios', params: { usuario: { nombre: '',
                                             correo_electronico: '',
                                             password: '',
                                             password_confirmation: '' } }
    end

    it 'contiene un status de unprocessable_entity' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
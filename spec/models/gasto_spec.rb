require 'rails_helper'

RSpec.describe Gasto, type: :model do
  let(:usuario) { Usuario.create(nombre: 'Test', correo_electronico: 'test@email.com', password: 'secret') }

  context 'con datos válidos' do
    let(:gasto) { Gasto.new(nombre: 'Compra camisa', fecha: Time.now, monto: 150_000, usuario: usuario) }

    it 'Crea un nuevo gasto en la base de datos' do
      expect(gasto.valid?).to eq(true)
    end
  end

  context 'con datos no válidos' do
    let(:gasto) { Gasto.new(nombre: '', fecha: Time.now, monto: '', usuario: usuario) }

    it 'No crea un nuevo gasto en la base de datos' do
      expect(gasto.valid?).to eq(false)
    end
  end
end

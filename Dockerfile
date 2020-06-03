# Stage 1 - imagen base con ruby instalado
FROM ruby:2.6.5
# Creacion del directorio de trabajo
RUN mkdir /myapp
# Seleccionamos el directorio de trabajo
WORKDIR /myapp
# Copiamos el archivo donde se especifican las dependencias
COPY Gemfile* ./
RUN gem install bundler:2.1.4
# Instalamos dependencias
RUN bundle install
# Copiamos el codigo de nuestra aplicacion al directorio de trabajo 
COPY . .
# Exponemos los puertos de la aplicacio
EXPOSE 3000
# Corremos nuestra aplicacion
CMD ["rails", "server", "-b", "0.0.0.0"]

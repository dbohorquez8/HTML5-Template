class Email
  include DataMapper::Resource
  property :id,				Serial
  property :created_at, 	DateTime
  property :type_user, String
  
  property :email, String, :required => true, :unique => true,
  :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
  :messages => {
    :presence  => 'Por favor introduce tu dirección de correo electrónico',
    :is_unique => 'Esta dirección de correo electrónico ya está registrada',
    :format    => "La dirección de correo electrónico es inválida"
  }
end



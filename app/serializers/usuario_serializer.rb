class UsuarioSerializer < ActiveModel::Serializer
	attributes :id, :nickname, :password, :email, :facebook, :twitter, :linkedin, :avatar
end
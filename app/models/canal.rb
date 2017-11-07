class Canal < ApplicationRecord
	has_many :usuarios
	has_many :mensajes
end

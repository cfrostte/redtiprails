class Mensaje < ApplicationRecord
	belongs_to :destinatario,	:class_name => "Usuario"#, :foreign_key => 'destinatario_id'
	belongs_to :remitente,		:class_name => "Usuario"#, :foreign_key => 'remitente_id'
	# belongs_to :canal	 
end

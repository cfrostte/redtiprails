class AddFieldsMessagge < ActiveRecord::Migration[5.1]
  def change
  	# add_reference :mensajes, :remitente, index: true , foreign_key: true
  	# add_reference :mensajes, :destinatatrio, index: true , foreign_key: true


  	#para bd postgrsql lo siguiente
  	# add_foreign_key :mensajes, :usuarios, column: :remitente_id
  	# add_foreign_key :mensajes, :usuarios, column: :destinatario_id
  end
end

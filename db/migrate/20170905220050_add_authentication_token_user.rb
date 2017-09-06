class AddAuthenticationTokenUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :usuarios, :authentication_token, :string
  end
end

class AddSignatureToRepresentative < ActiveRecord::Migration
  def change
    add_reference :representatives, :signature, index: true, foreign_key: true
  end
end

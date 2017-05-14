class CreateSecurities < ActiveRecord::Migration[5.1]
  def change
    create_table :securities do |t|
      t.text :security_type

      t.timestamps
    end
  end
end

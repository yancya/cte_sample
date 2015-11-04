class CreateHoges < ActiveRecord::Migration
  def change
    create_table :hoges do |t|
      t.text :name
    end
  end
end

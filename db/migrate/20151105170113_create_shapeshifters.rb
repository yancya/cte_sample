class CreateShapeshifters < ActiveRecord::Migration
  def change
    create_table :shapeshifters do |t|
    end

    execute <<-SQL
   ALTER TABLE shapeshifters
ADD CONSTRAINT forbid_to_insert_shapeshifters
         CHECK (false)
    SQL
  end
end

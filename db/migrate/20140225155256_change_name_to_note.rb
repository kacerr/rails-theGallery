class ChangeNameToNote < ActiveRecord::Migration
  def change
  	rename_column :images, :filename, :note
  end
end

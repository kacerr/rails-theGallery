class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
	    t.string   "filename"
	    t.string   "path"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
  end
end

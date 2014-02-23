module GalleriesHelper
	def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      #render(association.to_s.singularize + "_fields", f: builder)
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def images_with_no_spaces_between(images)
		out = []
		images.each do |image|
			out << <<-EOM
			<a class=\"fancybox\" rel=\"gallery1\"  
					href=\"/uploads/gallery_#{image.gallery_id}/#{image[:path]}\" 
					class=\"gallery-image\" style=\"display: inline; max-width:250px;\" class=\"gallery-image\"
					title=\"#{image[:path]}\"
						>
				<img src=\"/uploads/gallery_#{image.gallery_id}/#{image[:path]}\" class=\"gallery-image\" style=\"display: inline; max-width:250px;\">
			</a>
			EOM
		end
		out.join
	end
end
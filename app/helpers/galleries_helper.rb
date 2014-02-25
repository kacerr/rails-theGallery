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
			next if image[:path].blank? 
			# we figure out if images thumbnail exists
			if File.exist?("#{Rails.root}/public/uploads/gallery_#{image.gallery_id}/thumb_#{image[:path]}")
			else
				# if not, we generate it
				#logger.info "#{Rails.root}/public/uploads/gallery_#{image.gallery_id}/#{image[:path]}"
				image_to_resize = MiniMagick::Image.open("#{Rails.root}/public/uploads/gallery_#{image.gallery_id}/#{image[:path]}")
				image_to_resize.resize "200x200"
				image_to_resize.write  "#{Rails.root}/public/uploads/gallery_#{image.gallery_id}/thumb_#{image[:path]}"
				#out << image_to_resize.inspect
			end

			out << <<-EOM
			<a class=\"fancybox\" rel=\"gallery1\"  
					href=\"/uploads/gallery_#{image.gallery_id}/#{image[:path]}\" 
					title=\"#{image[:path]}\"
						><img src=\"/uploads/gallery_#{image.gallery_id}/thumb_#{image[:path]}\" class=\"gallery-image\" style=\"display: inline;\"></a>
			EOM
		end
		out.join
	end
end

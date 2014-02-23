json.array!(@admin_galleries) do |admin_gallery|
  json.extract! admin_gallery, :id, :name, :description
  json.url admin_gallery_url(admin_gallery, format: :json)
end

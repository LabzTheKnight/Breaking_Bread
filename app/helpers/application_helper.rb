module ApplicationHelper
	# Render an image for an ActiveStorage attachment or Cloudinary public_id.
	# attachment - an ActiveStorage attachment (e.g. photo) or nil
	# fallback - HTML-safe fallback content when no image is present
	# opts - passed to the image tag helper
	def asset_image_tag_for(attachment, fallback: nil, **opts)
		if attachment.is_a?(ActiveStorage::Attachment) || attachment.is_a?(ActiveStorage::Attached::One)
			# ActiveStorage attachment - individual attachment or singular association
			image_tag url_for(attachment), **opts
		elsif attachment.respond_to?(:attached?) && attachment.attached?
			# ActiveStorage attachments collection (has_many_attached)
			image_tag url_for(attachment), **opts
		elsif attachment.present? && attachment.is_a?(String)
			# Cloudinary public id (string)
			# Only call cl_image_tag if Cloudinary is available and configured
			if defined?(Cloudinary) && Cloudinary.config.respond_to?(:cloud_name) && Cloudinary.config.cloud_name.present?
				begin
					cl_image_tag attachment, **opts
				rescue StandardError
					fallback
				end
			else
				fallback
			end
		else
			fallback
		end
	end
end

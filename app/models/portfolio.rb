class Portfolio < ApplicationRecord
	has_attached_file :photo
	validates_attachment :photo,:presence => true,
                     content_type: { content_type: /\Aimage\/.*\z/ },
                     size: { less_than: 1.megabyte }
end

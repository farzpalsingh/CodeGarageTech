class Career < ApplicationRecord
	has_attached_file :resume_file
	validates_attachment :resume_file,:presence => true,
                     content_type: { content_type: /\Aapplication\/.*\z/ },
                     size: { less_than: 1.megabyte }
end

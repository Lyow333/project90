class Post < ApplicationRecord
	has_one_attached :image
	has_many :comments, dependent: :destroy
	has_one :view_count, dependent: :destroy
end

class Blog < ApplicationRecord
  enum status: { draft: 0, publushed: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
end

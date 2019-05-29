class Review < ApplicationRecord
  belongs_to :article
  validates_presence_of :score, :comment
end

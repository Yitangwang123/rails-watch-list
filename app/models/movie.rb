class Movie < ApplicationRecord
  has_many :bookmarks
  # has_many :lists, through: :bookmarks

  validates :title, uniqueness: true
  validates :title, :overview, presence: true
end

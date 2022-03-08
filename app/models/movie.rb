class Movie < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[title original_title]

  validates :title, :synopsis, :rating,
            :original_language, :original_title,
            :release_date, presence: true

  def synopsis_first_sentence
    synopsis.match(/^([^.]+)/)[0]
  end
end

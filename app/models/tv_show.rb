class TvShow < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[title original_title]

end

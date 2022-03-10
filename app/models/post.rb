class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :qr_code

  private

  def generate_qr_code
    
  end
end

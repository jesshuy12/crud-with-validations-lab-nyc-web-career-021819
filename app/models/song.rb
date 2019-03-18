class Song < ApplicationRecord

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false]}
  validate :released_method, :release_year_method
  validates :artist_name, presence: true

  def released_method
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "Must have a release year")
    end
  end

  def release_year_method
    if self.release_year.to_i > DateTime.now.year.to_i
      errors.add(:release_year_method, "release year cant be in the future")
    end
  end

end

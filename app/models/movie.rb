# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Director < ApplicationRecord
  validates(:name, { :presence => true })

  class Movie

   belongs_to(:character)
     
  end

  def filmography
    key = self.id

    the_many = Movie.where({ :director_id => key })

    return the_many
  end
end

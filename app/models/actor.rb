# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  validates(:name, { :presence => true })

  def characters
    matching_characters = Character.where({ :actor_id => self.id })
    return matching_characters
  end

  def filmography
    the_many = Array.new

    self.characters.each do |joining_record|
      destination_record = Movie.where({ :id => joining_record.movie_id }).at(0)
      the_many.push(destination_record)
    end

    return the_many
  end
end

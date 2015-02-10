class Photo < ActiveRecord::Base
  has_and_belongs_to_many :tags

  def tag_names
    tags.map(&:name).join(", ")
  end
end

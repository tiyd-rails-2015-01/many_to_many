class Photo < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments

  validates :name, presence: true

  accepts_nested_attributes_for :comments,
      :allow_destroy => true,
      :reject_if     => :all_blank

  def tag_names
    tags.map(&:name).join(", ")
  end
end

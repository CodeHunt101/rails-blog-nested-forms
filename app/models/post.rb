class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  
  accepts_nested_attributes_for :tags, reject_if: proc {|attributes| attributes['name'].blank?}
  validates_presence_of :name, :content

  #WHY THE FOLLOWING WOULDN'T WORK IN REAL WORLD OR IT'S JUST BECAUSE OF THE TEST CONDITIONS?

  # def tags_attributes=(tags_attributes)
  #   tags_attributes.values.each do |tags_attribute|
  #     if !tags_attribute[:name].blank?
  #       tag = Tag.find_or_create_by(tags_attribute)
  #       self.tags << tag
  #     end
  #   end
  # end
end

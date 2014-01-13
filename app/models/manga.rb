class Manga < ActiveRecord::Base
  before_create :create_slug
  has_many :chapters
  attr_accessible :name, :synopsis, :imageurl
  attr_protected :slug

  validates_presence_of :name, :synopsis, :imageurl

  def to_param
    slug
  end

  def create_slug
    self.slug = name.parameterize
  end
  
  def self.create_manga!(options = {})
    Manga.transaction do
      manga = Manga.create!(:name => options[:manga_name], :synopsis => options[:manga_synopsis], :imageurl => options[:manga_imageurl])
    end
    rescue
  end

end

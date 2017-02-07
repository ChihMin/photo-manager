class Album < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :albums, :dependent => :destroy
  belongs_to :album
  validates_presence_of :title
end

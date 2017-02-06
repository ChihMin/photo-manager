class Post < ActiveRecord::Base
  belongs_to :album
  mount_uploader :avatar, AvatarUploader
end

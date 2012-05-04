class Pet < ActiveRecord::Base
  mount_uploader :photo, PicUpload
end
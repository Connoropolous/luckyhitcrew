class Blog < ActiveRecord::Base
  attr_accessible :body, :title, :mediatype, :mediaurl
end

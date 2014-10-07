class User < ActiveRecord::Base
  include Tasuku::Concerns::Author
end

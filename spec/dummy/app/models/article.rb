class Article < ActiveRecord::Base
  include Tasks::Concerns::Verifiable
end

module Tasuku
  class Taskables::Poll::Vote < ActiveRecord::Base
    belongs_to :answer, class_name: 'Tasuku::Taskables::Poll::Answer'
    belongs_to :option, class_name: 'Tasuku::Taskables::Poll::Option'
  end
end

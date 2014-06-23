# This migration is deficient in that it doesn't send `each` on line 5 and so does nothing,
# but since it has already been run we have to keep it around.
class MigrateExistingDate < ActiveRecord::Migration
  def up
    %w(Image::Response Question::Answer Text::Response URL::Response).each do |class_name|
      "Tasks::Taskables::#{class_name}".constantize.send(:all) do |model|
        if model.request.task.present?
          Tasks::Taskables::Taskable::Response.create do |response|
            response.author = model.author
            response.submittable = model
            response.task = model.request.task
          end
        end
      end
    end
  end
end

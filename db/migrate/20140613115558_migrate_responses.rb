class MigrateResponses < ActiveRecord::Migration
  def up
    %w(Image::Response Question::Answer Text::Response URL::Response Verification::Confirmation).each do |class_name|
      "Tasuku::Taskables::#{class_name}".constantize.all.each do |model|
        if model.request.task.present?
          Tasuku::Taskables::Taskable::Response.create! do |response|
            response.author      = model.author
            response.submittable = model
            response.task        = model.request.task
          end
        end
      end
    end
  end

  def down
    Tasuku::Taskables::Taskable::Response.destroy_all
  end
end

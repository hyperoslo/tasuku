image_request = Tasks::Taskables::Image::Request.create! text: "Upload a picture"
task          = Tasks::Task.create! taskable: image_request

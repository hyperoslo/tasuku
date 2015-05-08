image_request = Tasks::Taskables::Image::Request.create! text: 'Upload a picture'
task          = Tasks::Task.create! taskable: image_request

url_request   = Tasks::Taskables::URL::Request.create! text: 'Specify a URL'
task          = Tasks::Task.create! taskable: url_request

text_request  = Tasks::Taskables::Text::Request.create! text: 'Write something'
task          = Tasks::Task.create! taskable: text_request

code_request  = Tasks::Taskables::Code::Request.create! text: 'Enter the code', code: '1337'
task          = Tasks::Task.create! taskable: code_request

question      = Tasks::Taskables::Question.create! text: 'Choose something'
option        = Tasks::Taskables::Question::Option.create! question: question, text: 'One option'
option        = Tasks::Taskables::Question::Option.create! question: question, text: 'Another option'
task          = Tasks::Task.create! taskable: question

quiz          = Tasuku::Taskables::Quiz.create! text: "A Quiz for you", description: "Because interwebs"
quiz.questions << Tasks::Taskables::Question.create! text: 'Question for a quiz'
quiz.questions << Tasks::Taskables::Question.create! text: 'Second quiz question'
quiz.questions << Tasks::Taskables::Question.create! text: 'Third quiz question'

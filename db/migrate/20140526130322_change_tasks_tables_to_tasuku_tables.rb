class ChangeTasksTablesToTasukuTables < ActiveRecord::Migration
  def change
    remove_index 'tasks_taskables_image_responses', name: 'tasks_taskable_image_responses_author'
    remove_index 'tasks_taskables_image_responses', name: 'index_tasks_taskables_image_responses_on_request_id'
    remove_index 'tasks_taskables_question_answers', name: 'tasks_taskable_question_answers_author'
    remove_index 'tasks_taskables_question_options', name: 'index_tasks_taskables_question_options_on_question_id'
    remove_index 'tasks_taskables_question_votes', name: 'index_tasks_taskables_question_votes_on_answer_id'
    remove_index 'tasks_taskables_question_votes', name: 'index_tasks_taskables_question_votes_on_option_id'
    remove_index 'tasks_taskables_text_responses', name: 'tasks_taskable_text_responses_author'
    remove_index 'tasks_taskables_url_responses', name: 'tasks_taskable_url_responses_author'
    remove_index 'tasks_taskables_url_responses', name: 'index_tasks_taskables_url_responses_on_request_id'
    remove_index 'tasks_taskables_verification_confirmations', name: 'tasks_taskable_verification_confirmation_author'
    remove_index 'tasks_taskables_verification_confirmations', name: 'tasks_taskable_verification_confirmation_verification'
    remove_index 'tasks_taskables_verifications', name: 'index_tasks_taskable_verifications_verifiable'
    remove_index 'tasks_tasks', name: 'index_tasks_tasks_on_taskable_id_and_taskable_type'

    rename_table 'tasks_taskables_image_requests', 'tasuku_taskables_image_requests'
    rename_table 'tasks_taskables_image_responses', 'tasuku_taskables_image_responses'
    rename_table 'tasks_taskables_question_answers', 'tasuku_taskables_question_answers'
    rename_table 'tasks_taskables_question_options', 'tasuku_taskables_question_options'
    rename_table 'tasks_taskables_question_votes', 'tasuku_taskables_question_votes'
    rename_table 'tasks_taskables_questions', 'tasuku_taskables_questions'
    rename_table 'tasks_taskables_text_requests', 'tasuku_taskables_text_requests'
    rename_table 'tasks_taskables_text_responses', 'tasuku_taskables_text_responses'
    rename_table 'tasks_taskables_url_requests', 'tasuku_taskables_url_requests'
    rename_table 'tasks_taskables_url_responses', 'tasuku_taskables_url_responses'
    rename_table 'tasks_taskables_verification_confirmations', 'tasuku_taskables_verification_confirmations'
    rename_table 'tasks_taskables_verifications', 'tasuku_taskables_verifications'
    rename_table 'tasks_tasks', 'tasuku_tasks'

    add_index 'tasuku_taskables_image_responses', ['author_id', 'author_type'], name: 'tasuku_taskable_image_responses_author'
    add_index 'tasuku_taskables_image_responses', ['request_id'], name: 'index_tasuku_taskables_image_responses_on_request_id'
    add_index 'tasuku_taskables_question_answers', ['author_id', 'author_type'], name: 'tasuku_taskable_question_answers_author'
    add_index 'tasuku_taskables_question_options', ['question_id'], name: 'index_tasuku_taskables_question_options_on_question_id'
    add_index 'tasuku_taskables_question_votes', ['answer_id'], name: 'index_tasuku_taskables_question_votes_on_answer_id'
    add_index 'tasuku_taskables_question_votes', ['option_id'], name: 'index_tasuku_taskables_question_votes_on_option_id'
    add_index 'tasuku_taskables_text_responses', ['author_id', 'author_type'], name: 'tasuku_taskable_text_responses_author', unique: true
    add_index 'tasuku_taskables_url_responses', ['author_id', 'author_type'], name: 'tasuku_taskable_url_responses_author', unique: true
    add_index 'tasuku_taskables_url_responses', ['request_id'], name: 'index_tasuku_taskables_url_responses_on_request_id'
    add_index 'tasuku_taskables_verification_confirmations', ['author_id', 'author_type'], name: 'tasuku_taskable_verification_confirmation_author'
    add_index 'tasuku_taskables_verification_confirmations', ['verification_id'], name: 'tasuku_taskable_verification_confirmation_verification'
    add_index 'tasuku_taskables_verifications', ['verifiable_id', 'verifiable_type'], name: 'index_tasuku_taskable_verifications_verifiable', unique: true
    add_index 'tasuku_tasks', ['taskable_id', 'taskable_type'], name: 'index_tasuku_tasks_on_taskable_id_and_taskable_type'
  end
end

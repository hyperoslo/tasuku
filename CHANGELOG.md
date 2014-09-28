# Change log
All notable changes to this project will be documented in this file.

## Unreleased

## 1.0.0
### Added
- You may now set prerequisites for completing tasks.
- Submit buttons are now disabled upon being clicked to prevent accidental form resubmission.
- Questions, image requests, url requests and text requests may now have a video.
- Added a new taskable `Code::Request`.
- Added an optional reply upon answering a question.
- Added additional translations

### Fixed
- Fixed a bug that caused the application to crash upon submitting an answer without selecting
an option.
- Fixed a bug that caused `after_completion_path_for` to be scoped to Tasuku's routes rather
than the application it is mounted on.
- Fixed some translations.
- Fixed a bug that caused seeds to fail.

## 0.1.1
### Fixed
- Fixed a bug that prevented existing responses from being migrated to the new proxy,
causing tasks to appear as incomplete despite being completed.

## 0.1.0
### Deprecated
- Tasks have been renamed to Tasuku. You may still reference `Tasks` for
backwards compatibility, but if you're extending anything there's a good
chance that your application will break.

## 0.0.1
### Added
- Everything

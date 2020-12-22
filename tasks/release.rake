# frozen_string_literal: true

namespace :release do
  desc 'generate changelog'
  task :generate_changelog do |_task, _args|
    `github_changelog_generator -u rossmeissl -p verbs`
  end
end

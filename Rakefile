require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.warning = false
  t.test_globs = "test/**/test_*.rb"
end

task :release_check do
  unless `git branch` =~ /^\* main/
    abort "You must be on the main branch to release!"
  end
  unless `git status` =~ /^nothing to commit/m
    abort "Nope, sorry, you have unfinished business"
  end
end

task :release => :release_check
task :default => :test

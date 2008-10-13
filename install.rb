require 'fileutils'

mkdir(File.join(RAILS_ROOT, "app/views/partials/forms")) unless File.exist?(File.join(RAILS_ROOT, "app/views/forms"))

field_file = '_field.html.erb'
FileUtils.cp_r(File.join(File.dirname(__FILE__), "/lib/forms/_field.html.erb"), File.join(RAILS_ROOT, "app/views/partials/forms/", field_file))

field_with_errors_file = '_field_with_errors.html.erb'
FileUtils.cp_r(File.join(File.dirname(__FILE__), "/lib/forms/_field_with_errors.html.erb"), File.join(RAILS_ROOT, "app/views/partials/forms/", field_with_errors))

puts IO.read(File.join(File.dirname(__FILE__), 'README'))
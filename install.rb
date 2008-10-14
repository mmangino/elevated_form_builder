require 'fileutils'

FileUtils.mkdir_p("app/views/partials/forms")

field_file = '_field.html.erb'
FileUtils.cp_r(File.dirname(__FILE__) + "/lib/forms/_field.html.erb", "app/views/partials/forms/" + field_file)

field_with_errors_file = '_field_with_errors.html.erb'
FileUtils.cp_r(File.dirname(__FILE__) + "/lib/forms/_field_with_errors.html.erb", "app/views/partials/forms/" + field_with_errors_file)

puts IO.read(File.join(File.dirname(__FILE__), 'README'))
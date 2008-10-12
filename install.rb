require 'fileutils'
FileUtils.copy(Dir[File.dirname(__FILE__) + '/lib/elevated_form_builder.rb'], File.dirname(__FILE__) + '/../../../lib/')
FileUtils.copy(Dir[File.dirname(__FILE__) + '/lib/template_form_builder.rb'], File.dirname(__FILE__) + '/../../../lib/')
FileUtils.copy(Dir[File.dirname(__FILE__) + '/app/helpers/application_helper.rb'], File.dirname(__FILE__) + '/../../../app/helpers/')
FileUtils.copy(Dir[File.dirname(__FILE__) + '/examples/_field_with_errors.html.erb'], File.dirname(__FILE__) + '/../../../app/views/partials/forms/')
FileUtils.copy(Dir[File.dirname(__FILE__) + '/examples/_field.html.erb'], File.dirname(__FILE__) + '/../../../app/views/partials/forms/')
puts IO.read(File.join(File.dirname(__FILE__), 'README'))
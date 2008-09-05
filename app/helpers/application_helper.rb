module ApplicationHelper

  def error_handling_form_for(record_or_name_or_array, *args, &proc)
    options = args.detect { |argument| argument.is_a?(Hash) }
    if options.nil?
      options = { :builder => TemplateFormBuilder }
      args << options
    end
    options[:builder] = TemplateFormBuilder unless options.nil?
    form_for(record_or_name_or_array, *args, &proc)
  end
    
end
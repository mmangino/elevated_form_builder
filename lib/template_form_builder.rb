class TemplateFormBuilder < ActionView::Helpers::FormBuilder
  second_param = %w(text_field text_area hidden_field password_field file_field check_box date_select datetime_select time_select)
  third_param = %w(radio_button country_select select time_zone_select)
  fifth_param = %w(collection_select)
  
  def self.create_with_offset(name,offset)
    define_method name do |field,*args|
      options = args[offset] || {}
      build_shell(field,options) do
        super
      end
    end    
  end
  
  second_param.each do |name|
    create_with_offset(name,0)
  end
  third_param.each do |name|
    create_with_offset(name,1)
  end
  fifth_param.each do |name|
    create_with_offset(name,3)
  end
  
  def template_with_error
    "forms/field_with_errors"
  end
  
  def template_without_error
    "forms/field"
  end
  
  def build_shell(field,options)
    @template.capture do
      locals={:field_id=>field_id(field), :element => yield,:label=>label_for(field,options)}
      if has_errors_on?(field)
        @template.render :partial=>template_with_error, :locals=>locals.merge(:error=>error_message(field,options))
      else
        @template.render :partial=>template_without_error, :locals=>locals        
      end
    end
  end
  
  def has_errors_on?(field)
    ! (object.nil? || object.errors.on(field).blank?)
  end
  
  def field_id(field)
    "#{self.object.class}_#{field}".downcase
  end
  
  def label_for(field,options)
    options.delete(:label) || field.to_s.humanize
  end
  
  def error_message(field,options)
    if has_errors_on?(field)
      errors=object.errors.on(field)
      errors.is_a?(Array) ? errors.to_sentence : errors
    else
      ""
    end
  end
  
end
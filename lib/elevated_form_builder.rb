class ElevatedFormBuilder < ActionView::Helpers::FormBuilder
  [ :time_zone_select, :text_field, :password_field, :text_area, :datetime_select, :check_box, :date_select, :link_to, :file_field ].each do |field_type|
    define_method field_type do |*args|
      name = args.first
      options = args.size > 1 ? args[1] : { }
      build_outer(name, options) do 
        super(name, options)
      end
    end
  end
    
  
  def header(str)
    "<div class='form_header'>#{str}</div><div class='clear'></div>"
  end
  
  
  def select(method, collection, options = { }, html_options = { })
    build_outer(method, options) do
      super
    end
  end


  def time_zone_select(method, collection, options = { }, html_options = { })
    build_outer(method, options) do
      super
    end
  end


  def errors_for(method)
    if self.object and self.object.errors.on(method)
      "<div class='form_error_message' id='error_for_#{method}'>#{Inflector.humanize(method.to_s)} #{self.object.errors.on(method)}</div>"
    end
  end

  
  def build_outer(method, options = { }, &block)
    if options[:hide_errors]
      options.delete :hide_errors
      return yield
    end
  
    label = options.delete(:label) || Inflector.humanize(method.to_s)
    right_label = options.delete(:right_label)
    error_message = options[:only_error_message].blank? ? label + " " + error_message_for(object, method) : object.errors[method] unless object.nil? || object.errors[method].blank?
    error_style = "fieldWithErrors" unless error_message.blank?
    error_message = "<div class='form_error_message' id='error_for_#{method}'>#{error_message}</div>" unless error_message.blank?

    lay_out_form_field(label, error_message, right_label, &block)
  end


  def lay_out_form_field(label, error, right_label)
    @template.content_tag "p", 
                          @template.content_tag("label", label, 
                                                :for => "#{@object_name}_#{label.downcase}") + 
                                                '<br />' + 
                          "#{error} #{yield} #{right_label}"
  end

 
  def error_message_for(object, method)
    errors = object.errors.on(method)
    errors.is_a?(Array) ? errors.to_sentence : errors
  end
  
end
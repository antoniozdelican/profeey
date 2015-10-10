module ApplicationHelper

  # Bootstrap helper to get appropriate flash class
  def bootstrap_class_for flash_type
    case flash_type
      when 'succes'
        'alert-success' # Green
      when 'error'
        'alert-danger' # Red
      when 'alert'
        'alert-warning' # Yellow
      when 'notice'
        'alert-info' # Blue
      else
        flash_type.to_s
    end
  end

  # Devise helpers to render forms in any page
  def resource_name
    :user
  end
  def resource
    @resource ||= User.new
  end 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # View helper that determins current controller
  def controller_name
    params[:controller]
  end
end

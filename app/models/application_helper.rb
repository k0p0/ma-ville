module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when :alert   then "alert-error"
    when :notice  then "alert-success"
    end
  end
end

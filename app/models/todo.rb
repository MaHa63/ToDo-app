class Todo < ApplicationRecord
  
  belongs_to :user
  
  def created_nil_out
  	if created == nil 
  		result = ""
  	else
  		result = created.strftime("%d-%m-%Y")
  	end
  	"#{result}"
  end
  
  def duedate_nil_out
  	if duedate == nil 
  		result = ""
  	else
  		result = duedate.strftime("%d-%m-%Y")
  	end
  	"#{result}"
  end
  
   def completed_nil_out
  	if completed == nil 
  		result = ""
  	else
  		result = completed.strftime("%d-%m-%Y")
  	end
  	"#{result}"
  end
  
  def priority_as_text
    case priority
    when 1
      result = "Kriittinen"
    when 2
      result = "Tärkeä"
    when 3
      result = "Hyödyllinen"
    else
      result = " "
    end
    
    "#{result}"
  end
end

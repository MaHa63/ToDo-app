class Todo < ApplicationRecord
  
  
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
end

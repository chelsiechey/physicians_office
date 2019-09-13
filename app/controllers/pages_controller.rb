class PagesController < ActionController::Base
def search  
    @parameter = params[:search].downcase  
    @results = Patient.all.where("lower(first_name) LIKE :search OR lower(last_name) LIKE :search", search: "%#{@parameter}%") 
end

end


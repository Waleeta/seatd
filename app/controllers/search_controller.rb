class SearchController < ApplicationController

  def index
    @businesses = Business.all
    @services = Service.where(service_type: params[:service])
    business_ids = @services.map {|service| service.business_id }
    found_businesses = business_ids.map {|id| Business.find(id) }
    p found_businesses
  end


end

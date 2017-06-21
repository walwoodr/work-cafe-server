class CafesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def search
    raise params.inspect
    zipcode = params[:zipcode]
    @json = Cafe.find_or_build(zipcode)
    render json: @json
  end

  def update
    cafe_hash = params["cafe"]
    @cafe = Cafe.find(cafe_hash["id"])
    @cafe.update(outlets: cafe_hash["outlets"], vibe: cafe_hash["vibe"], food: cafe_hash["food"], coffeeQuality: cafe_hash["coffeeQuality"], teaQuality: cafe_hash["teaQuality"], genderNeutralRestrooms: cafe_hash["genderNeutralRestrooms"])
    if @cafe.valid?
      set_access_control_headers
      head :ok
    else
      head 418
    end
  end

  # {"id"=>"6",  "outlets"=>nil, "vibe"=>[], "food"=>["pastries", "vegan", "gluten free"], "genderNeutralRestrooms"=>nil, "coffeeQuality"=>"Exceptional Coffee", "teaQuality"=>"Good Tea"

  def options
    if access_allowed?
      set_access_control_headers
      head :ok
    else
      head :forbidden
    end
  end

  private
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = request.env['HTTP_ORIGIN']
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = '1000'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,content-type'
  end


  def access_allowed?
    allowed_sites = ['http://localhost:3000'] #you might query the DB or something, this is just an example
    return allowed_sites.include?(request.env['HTTP_ORIGIN'])
  end
end

class CafesController < ApplicationController
  def search
    zipcode = params[:zipcode]
    @json = Cafe.find_or_build(zipcode)
    render json: @json
  end
end

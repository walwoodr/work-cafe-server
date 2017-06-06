class CafesController < ApplicationController
  def search
    zipcode = params[:zipcode]
    @json = Cafe.search(zipcode)
    render json: @json["businesses"]
  end
end

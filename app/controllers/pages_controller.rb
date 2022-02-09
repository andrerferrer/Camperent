class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home, raise: false
  def home
  end

  def campers
    @campers = Camper.all

    @markers = @campers.geocoded.map do |camper|
      {
        lat: camper.latitude,
        lng: camper.longitude,
        info_window: render_to_string(partial: "info_window", locals: { camper: camper })
      }
    end
  end
end

class StreamsController < ApplicationController
  include ActionController::Live

  PRINT_TIMES = 100

  def show
    response.headers['Content-Type'] = 'text/event-stream'
    PRINT_TIMES.times { response.stream.write("#{Apartment::Tenant.current}\n") }
  ensure
    response.stream.close
  end
end

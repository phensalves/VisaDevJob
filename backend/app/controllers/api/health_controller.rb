class Api::HealthController < ApplicationController
  def ping
    render json: { status: "ok" }, status: :ok
  end
end

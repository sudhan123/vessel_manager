module Api
  class VesselController < Api::ApplicationController
    def index
      @vessel = Vessel.all.order(created_at: :desc)
    end

    def create
      @vessel = Vessel.new(vessel_params)
      return error_422(@vessel.errors.full_messages) unless @vessel.valid?
      @vessel.save!
      render json: { message: 'vessel has been created successfully' }, status: :ok
    rescue StandardError => e
      error_400(e.message)
    end

    def update
      #return not found error if no vessel exists
      @vessel = Vessel.find(params[:id])
      return error_404 if @vessel.nil?

      @vessel.assign_attributes(vessel_params)
      return error_422(@vessel.errors.full_messages) unless @vessel.valid? #validation error

      @vessel.save
    end

    private

    def vessel_params
      params.permit(
        :name,
        :owner_id,
        :naccs_code
      )
    end
  end
end


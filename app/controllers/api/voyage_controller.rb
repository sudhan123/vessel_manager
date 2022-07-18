module Api
  class VoyageController < Api::ApplicationController
    def index
      @voyage = Voyage.all.order(created_at: :desc)
    end

    def create
      #check vessel if it does not exist then dont allow to create voyage
      @vessel = Vessel.find(params[:vessel_id])
      return error_404 if @vessel.nil?

      @voyage = Voyage.new(voyage_params)
      return error_422(@voyage.errors.full_messages) unless @voyage.valid?

      @voyage.save!
      render json: { message: 'voyage has been created successfully' }, status: :ok
    rescue StandardError => e
      error_400(e.message)
    end

    def update
      @voyage = Voyage.find(params[:id])
      return error_404 if @voyage.nil?

      @voyage.assign_attributes(voyage_params)
      return error_422(@voyage.errors.full_messages) unless @voyage.valid?

      @voyage.save
    end

    private

    def voyage_params
      params.permit(
        :from,
        :to,
        :date,
        :start_time,
        :vessel_id,
        :end_time
      )
    end
  end
end


module Api
  class VoyageController < Api::ApplicationController
    def index
      @voyage = Voyage.all.order(created_at: :desc)
      render template: '/api/vessel/index', status: :ok
    end

    def create

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
        :end_time
      )
    end
  end
end


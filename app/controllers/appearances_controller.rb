class AppearancesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_appearance

  def create
      appearance = Appearance.create!(appearance_params)
      render json: appearance.to_json(include: [episode: {only: [:id, :date, :number]}, guest: {only: [:id, :name, :occupation]}], except: [:created_at, :updated_at, :episode_id, :guest_id,]), status: :created

  end

  private

  def appearance_params
      params.permit(:episode_id, :guest_id, :rating)
  end
  def invalid_appearance(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end


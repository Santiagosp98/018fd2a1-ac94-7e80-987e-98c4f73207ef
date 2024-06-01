# frozen_string_literal: true

# Main application controller.
class ApplicationController < ActionController::API
  rescue_from ResourceNotFoundError, with: :handle_not_found
  rescue_from UnprocessableEntityError, with: :handle_unprocessable_entity

  private

  def handle_e(exception, status)
    render json: { message: exception.message }, status:
  end

  def handle_not_found(exception)
    handle_e(exception, :not_found)
  end

  def handle_unprocessable_entity(exception)
    handle_e(exception, :unprocessable_entity)
  end
end

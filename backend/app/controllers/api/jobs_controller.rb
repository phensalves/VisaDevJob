class Api::JobsController < ApplicationController
  def index
    jobs = Job.all # Lazy loading starts here
    jobs = jobs.search(job_params[:query]) if job_params[:query].present?
    jobs = jobs.jobs_by_country(job_params[:country]) if job_params[:country].present?
    jobs = jobs.jobs_by_stack(job_params[:stack]) if job_params[:stack].present?
    jobs = jobs.paginate(job_params[:page] || 1, job_params[:per_page] || 10) # Pagination ensures only a subset is loaded

    render json: jobs.map(&:to_public_json), status: :ok
  end

  private

  def job_params
    params.permit(:query, :country, :stack, :page, :per_page).to_h.symbolize_keys
  end
end

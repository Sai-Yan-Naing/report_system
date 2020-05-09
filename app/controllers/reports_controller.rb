class ReportsController < ApplicationController
  def index
    # @reports = Report.all
    if logged_in?
      # @reports = Report.all
      @reports = Report.where(:user_id=>current_user.id)
    else
      redirect_to new_session_path
      end
  end
  def new
  	# @report = Report.new
    if logged_in?
      @report = Report.new
    else
      redirect_to new_session_path
      end
  end

  def show
  	# @report = Report.find(params[:id])
    if logged_in?
      @report = Report.find(params[:id])
    else
      redirect_to new_session_path
      end
  end

  def edit
  	# @report = Report.find(params[:id])
    if logged_in?
      @report = Report.find(params[:id])
    else
      redirect_to new_session_path
      end
  end

  def create
  	@report = Report.new(report_params)
  	if @report.save
  		redirect_to @report
  	else
  		render 'new'
  	end
  		
  end

  def update
  	@report = Report.find(params[:id])
  	if @report.update(report_params)
  		redirect_to @report
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@report = Report.find(params[:id])
  	@report.destroy
  	redirect_to @report
  end

  private
  def report_params
  	params.require(:report).permit(:user_id, :rp_date, :morning, :evening, :remark)
  end
end

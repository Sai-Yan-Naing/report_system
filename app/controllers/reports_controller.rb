class ReportsController < ApplicationController

  def index
    # @reports = Report.all
    if logged_in?
      # if is_admin?
        # redirect_to users_path
      # else
        # @reports = Report.all
        # @reports = Report.where(:user_id=>current_user.id)
        # @pagy, @reports = pagy(Report.limit(12).where(:user_id=>current_user.id), items: 10)
        # @pagy, @reports = pagy(Report.all, items: 10)
        # if params[:search]
          # @pagy, @reports = pagy(Report.where(:user_id=>current_user.id).search(params[:search]), items: 10)
          # @pagy, @reports =  pagy(Report.where(:morning LIKE params[:search]), items: 10)
        # else
              if params[:search]
                @pagy, @reports = pagy(Report.search(params[:search]), items: 10)
              elsif params[:id]
                @pagy, @reports = pagy(Report.where(:user_id=>params[:id]).order(:date), items: 10)
              else
                # @pagy, @reports = pagy(Report.all, items: 10)
                @pagy, @reports = pagy(Report.all.order(:date), items: 10)
              end
              # if params[:id]
              #   @pagy, @reports = pagy(Report.where(:user_id=>params[:id]), items: 10)
              # else
              #   # @pagy, @reports = pagy(Report.all, items: 10)
              #   @pagy, @reports = pagy(Report.all, items: 10)
              # end

              @reportss = Report.all
        # end
          
        # @pagy, @records = pagy(Product.limit(10))

        # respond_to do |format|
        #     format.html
        #     format.csv { send_data @reports.to_csv, filename: "reports-#{Date.today}.csv" }
        #   end

       respond_to do |format|
          format.html
          format.csv { send_data @reportss.to_csv, filename: "Reports-#{Date.today}.csv"}
          # format.xls 
          # format.xls  { send_data @posts.to_csv(col_sep: "\t"), filename: "Reposts-#{Date.today}.csv" }
        end
      # end
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
    # @user = User.find(params[current_user.id])
  	@report = Report.new(report_params)
    @report.user = current_user
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

   # def search
   #  @reports = Report.search(params[:search])
   #  end

  private
  def report_params
  	# params.require(:report).permit(:user_id, :date, :morning, :evening, :remark)
    params.require(:report).permit(:date, :morning, :evening, :remark)
  end
end

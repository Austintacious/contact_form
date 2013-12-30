class InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all
  end

  def show
    set_inquiry
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_to @inquiry, notice: 'Inquiry successfully submitted'
    else
      render action: 'new'
    end
  end

  def edit
    set_inquiry
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end 
  end

  def destroy
    set_inquiry
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def inquiry_params
    params.require(:inquiry).permit(:first_name, :last_name, :email, :subject, :description)
  end

end

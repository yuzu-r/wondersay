class StaticPagesController < ApplicationController
  def about
    @message = Message.new
  end

  def create_message
    @message = Message.new(message_params)
    respond_to do |format|
    if @message.valid?
        MessageMailer.contact(@message).deliver_now
        format.html { redirect_to about_path, notice: 'Sucessfully sent.' }
        format.js {flash[:notice] = "Message sent!"}
        format.json { render :about, status: :success }
      else
        format.html { render :about }
        format.js { }
        format.json   { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def message_params 
      params.require(:message).permit(:name, :email, :content)
    end

end

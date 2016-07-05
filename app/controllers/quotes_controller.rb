class QuotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @quote = Quote.find_by_id(params[:id])
    return render_not_found if @quote.blank?
  end

  def random
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      render :new, status: :unprocessable_entity
    else
      #render text: 'Successfully added!', status: :success
      redirect_to root_path
    end
  end

  def new
    @quote = Quote.new
  end

  private
    def quote_params
      params.require(:quote).permit(:quote, :author)
    end

end

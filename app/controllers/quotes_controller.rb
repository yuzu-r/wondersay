class QuotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :index]

  def show
    @quote = Quote.find_by_id(params[:id])
  end

  def random
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      render :new, status: :unprocessable_entity
    else
      redirect_to root_path
    end
  end

  def new
    @quote = Quote.new
  end

  private
    def quote_params
      params.require(:quote).permit(:quote, :author, :book)
    end

end

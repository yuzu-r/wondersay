class QuotesController < ApplicationController
  before_action :authenticate_user!, except: [:random, :show]

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
      redirect_to quotes_path, notice: 'Precept added!' 
    end
  end

  def new
    @quote = Quote.new
  end

  def index
    @quotes = Quote.all
  end

  def edit
    @quote = Quote.find_by_id(params[:id])
  end

  def update
    @quote = Quote.find_by_id(params[:id])
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: 'Precept edited successfully!' 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote = Quote.find_by_id(params[:id])
    @quote.destroy
    redirect_to quotes_path, notice: 'Precept deleted.' 
  end

  private
    def quote_params
      params.require(:quote).permit(:quote, :author, :book)
    end

end

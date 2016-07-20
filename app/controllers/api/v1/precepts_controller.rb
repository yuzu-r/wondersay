class PreceptsController < JSONAPI::ResourceController

end

module Api
  module V1
    class PreceptsController < JSONAPI::ResourceController
      def random
        quote = Quote.order("RANDOM()").first
        if quote
          render :json => {quote: quote.quote, author: quote.author, :callback => params[:callback]}
          # sometimes listed as params['callback']
        else
          render :json => {quote: "nothing here!", author: "nobody", :callback => params[:callback]}
        end
      end
    end
  end
end
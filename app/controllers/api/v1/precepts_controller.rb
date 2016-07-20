class PreceptsController < JSONAPI::ResourceController

end

module Api
  module V1
    class PreceptsController < JSONAPI::ResourceController
      def random
        quote = Quote.order("RANDOM()").first
        render :json => {quote: quote.quote, author: quote.author, :callback => params[:callback]}
        # sometimes listed as params['callback']
      end
    end
  end
end
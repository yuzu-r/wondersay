class PreceptsController < JSONAPI::ResourceController

end

module Api
  module V1
    class PreceptsController < JSONAPI::ResourceController
      respond_to :html, :json
      def random
        quote = Quote.order("RANDOM()").first
        if quote
          #render :json => {quote: quote.quote, author: quote.author, :callback => params[:callback]}
          # sometimes listed as params['callback']
          response = params[:callback] + '(' + quote.to_json + ')'
          #render :text => response
          respond_to do |format|
            format.html
            format.json { render :json => response}
          end
        else
          render :json => {quote: "nothing here!", author: "nobody", :callback => params[:callback]}
        end
      end
    end
  end
end
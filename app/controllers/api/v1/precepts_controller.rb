class PreceptsController < JSONAPI::ResourceController

end

module Api
  module V1
    class PreceptsController < JSONAPI::ResourceController
      respond_to :html, :json, :jsonp
      def random
        quote = Quote.order("RANDOM()").first
        if quote
          #render :json => {quote: quote.quote, author: quote.author, :callback => params[:callback]}
          # sometimes listed as params['callback']
          response = params[:callback] + '(' + quote.to_json + ')'
          #response.headers["Content-Type"] = "application/javascript"
          #render :text => response
          respond_to do |format|
            format.html
            format.json { render :json => response, content_type: 'application/javascript'}
          end
        else
          render :json => {quote: "nothing here!", author: "nobody", :callback => params[:callback]}
        end
      end
    end
  end
end
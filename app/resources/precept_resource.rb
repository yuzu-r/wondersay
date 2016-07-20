class PreceptResource < JSONAPI::Resource
  attributes :quote, :author
  model_name 'Quote'
end

module Api
  module V1
    class PreceptResource < JSONAPI::Resource
      # version 1
      attribute :quote
      attribute :author
      model_name 'Quote'    
    end
  end
end
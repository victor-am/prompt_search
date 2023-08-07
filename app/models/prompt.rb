class Prompt < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mapping do
    indexes :text, type: :text
  end

  def self.search(query, options)
    params = {
      query: {
        match: {
          text: { query: query, fuzziness: "AUTO" }
        }
      },
      size: options[:size]
    }
    __elasticsearch__.search(params)
  end
end

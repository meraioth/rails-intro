json.extract! comment, :id, :content, :reaction, :created_at, :updated_at
json.url comment_url(comment, format: :json)

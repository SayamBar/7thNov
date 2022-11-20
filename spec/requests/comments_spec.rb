require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /index" do
    article = Article.new(title:'Title',body:'Body')
    article.save
    it "renders the index template" do
      get article_comments_url(article) 
      expect(response).to have_http_status(200)
    end
  end
end

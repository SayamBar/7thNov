require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  describe "GET /index" do
    let!(:article_1) { create(:article, title:'vfv', body:'article without trait') }
    # pending "add some examples (or delete) #{__FILE__}"
    it 'render a successful response' do
      response = get articles_path
      expect(controller.view_assigns['articles']).to match_array([article_1])
      expect(response).to eq(200)
      # expect(response).to redirect_to(articles_path)
    end
  end

  describe "GET /new" do
    it "render a successful response" do
      get new_article_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it 'render a successful response' do
      article = Article.new(title:'Title',body:'Body')
      article.save
      get article_url(article)
      expect(response).to be_successful
    end
  end 
end

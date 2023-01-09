require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  describe "GET /index" do
    let!(:article_1) { create(:article, title:'vfv', body:'article without trait') }
    # pending "add some examples (or delete) #{__FILE__}"
    it 'render a successful response' do
      response = get articles_path
      # expect(controller.view_assigns['articles']).to match_array([article_1])
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
    article = Article.new(title:'Title',body:'Body')
    article.save
    it 'render a successful response' do
      get article_url(article)
      expect(response).to be_successful
    end
  end 

  # describe "GET #index" do
  #   it "renders the index template" do
  #     get articles_url 
  #     expect(response).to render_template("articles/index")
  #   end
  # end
  
  describe "GET #index" do
    it "renders the index template" do
      get articles_url 
      expect(response).to have_http_status(200)
    end
  end

  describe "GET index" do
    it "returns a 200" do
      get articles_path
      expect(response).to have_http_status(:ok)
    end
  end
end

require 'rails_helper'

RSpec.describe CommentsController, type: :request do
  # describe "GET /index" do
  #   article = Article.new(title:'Title',body:'Body')
  #   article.save
  #   it "renders the index template" do
  #     get article_comments_url(article) 
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe "POST /create" do
    # comment = Comment.create(commenter:"vfs",body:"vaaeb wgfa",article_id:article.id)
    it "renders create page" do
      article = Article.create(title:'Title',body:'Body')
      # comment = Comment.create(commenter:"vfs",body:"vaaeb wgfa")
      post article_comments_url(article,commenter:"svwse",body:"vea")
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /destroy" do
    it "deletes a specific comment" do
      article = Article.create(title:'Title',body:'Body')
      comment = Comment.create(commenter:"vfs",body:"vaaeb wgfa",article_id:article.id)
      delete article_comment_url(article_id:article.id,id:comment.id)
      expect(response).to have_http_status(303)
    end
  end

end

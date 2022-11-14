class Api::V1::ArticlesController < Api::V1::ApplicationController
  def index
    @articles = Article.all
    render json: @articles, status: 200
  end

  def show
    @article = Article.find(params[:id])
    if @article
      render json: @article, status: 200
    else
      render json: {error: "article not found."}
    end
  end

  def create
    @article = Article.new(title: params[:title],body: params[:body])
    if @article.save
      render json: @article, status: 200
    else
      render json: {error: "article not created"}
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(title: params[:title],body: params[:body])
    render json: @article, status: 200
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render json: Article.all 
  end
  private
    def article_params
      params.require(:article).permit([:title,:body])
    end
end

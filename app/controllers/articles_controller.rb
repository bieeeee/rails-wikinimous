class ArticlesController < ApplicationController
  before_action :set_articles

  def index
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # raise
    @article = Article.new(params_article)
    @article.save
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params_article)
    redirect_to article_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path status: :see_other
  end

  private

  def params_article
    params.require(:article).permit(:title, :content)
  end

  def set_articles
    @articles = Article.all
  end
end

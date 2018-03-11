class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'Eddie', password: '+his_1s_aStr0ngpw!', except: [:index, :show]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save ? (redirect_to @article) : (render 'new')
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to(articles_path)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params) ? (redirect_to @article) : (render 'edit')
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end


# /articles/:id(.:format)  articles#show

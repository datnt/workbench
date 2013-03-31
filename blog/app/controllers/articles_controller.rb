class ArticlesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user = current_user
    @article.save
    @article.save
    params[:category].each do |c|
      ArticleScope.create(:article => @article, :category_id => c)
    end
    redirect_to :action => "index"
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      @article.update_category(params[:category])
      redirect_to @article, notice: "Article has been updated."
    else
      render "edit"
    end
  end
  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to :action => "index"
  end
  
  def comment
    article = Article.find(params[:id])
    @comment = article.comments.create(:title => "N/A", :comment => params[:line], :user_id => current_user.id)
  end
  def publish
    article = Article.find(params[:id])
    article.published_at = Time.now
    article.save
    redirect_to :action => "index"
  end
end

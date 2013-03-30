module Api
  module V1
    class ArticlesController < BaseController
      doorkeeper_for :all
      respond_to :json

      def index
        respond_with current_user.articles
      end

      def create
        @article = Article.create(:name => params[:name], :content => params[:content], :user_id => current_user.id)
        @article.published_at =@article.created_at
        @article.save

        respond_with @article
      end
    end
  end
end
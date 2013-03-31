module Api
  module V1
    class ArticlesController < BaseController
      doorkeeper_for :all
      #      respond_to :json

      def index
        #        respond_with current_user.articles
        #        @article = current_user.articles.last
        #
        #        @str = {
        #          :article => [
        #            {
        #              :id => @article.id,
        #            }
        #          ]
        #
        #
        #        }

        arr1 = []
        current_user.articles.each do |a|
          objx={
            :id=>a.id,
            :name=>a.name,
            :content=>a.content
          }
          arr1 << objx
        end

        @str = {
          :articles=> arr1
        }


        render :json => @str,:callback => params[:callback]

      end

      def create
        @article = Article.create(:name => params[:name], :content => params[:content], :user_id => current_user.id)
        @article.published_at =@article.created_at
        @article.save

        @str = {
          :article => 
            {
            :id => @article.id,
            :content => @article.content
          }
        }


        #        respond_with @article
        render :json => @str
      end
    end
  end
end

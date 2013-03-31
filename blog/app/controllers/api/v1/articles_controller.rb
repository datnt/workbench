module Api
  module V1
    class ArticlesController < BaseController
      doorkeeper_for :all

      def index

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
        render :json => @str
      end
      def comment
        article = Article.find(params[:id])
        comment = article.comments.create(:title => "N/A", :comment => params[:comment], :user_id => current_user.id)
        str = {
          :comment =>
            {
            :id => comment.id,
            :comment => comment.comment
          }
        }
        render :json => str
      end
      
      def categories
        arr1 = []
        Category.all.each do |a|
          objx={
            :id=>a.id,
            :name=>a.name,
          }
          arr1 << objx
        end

        str = {
          :categories=> arr1
        }


        render :json => str,:callback => params[:callback]
      end
      def comments
        arr1 = []
        article = Article.find(params[:id])
        comments = article.comments
        comments.each do |a|
          objx={
            :id=>a.id,
            :comment=>a.comment,
          }
          arr1 << objx
        end

        str = {
          :comments=> arr1
        }


        render :json => str,:callback => params[:callback]
      end
    end
  end
end

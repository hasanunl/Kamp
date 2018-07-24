class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def new
        @article=Article.new
    end

    def edit
        
    end

    def destroy
        
        @article.destroy
       
        redirect_to articles_path
      end

    def index
        @articles = if params[:q].present?
                        #@articles = Article.where(title: params.[:q]).or(Article.where(text: params[:q]))    
                        @articles = Article.where("text LIKE :text",{:text => "#{params[:q]}%"})
                    else
                        @articles = Article.includes(:comments).all
                    end
    end

    def show
        
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article
          else
            render 'new'
          end
    end

    def update
       
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end
    
    private

    def article_params
        params.require(:article).permit(:title,:text)
    end

    def find_article
        @article = Article.find(params[:id])
    end
end

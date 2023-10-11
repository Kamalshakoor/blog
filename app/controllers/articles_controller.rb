class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit,:update,:destroy]

    def home
    end

    def show
        
    end

    def index
        @articles= Article.paginate(page: params[:page], per_page: 15)
    end

    def new
        @article=Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            redirect_to '/articles'
        else
            render 'edit'
        end
    end
    def destroy
        @article.destroy
        redirect_to '/articles'
    end


    private

    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end

end

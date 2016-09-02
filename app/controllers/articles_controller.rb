class ArticlesController < ApplicationController

    # Default Function
	def index
		@articles = Article.all
	end
	 
	# New Article - Form
	def new
		@article = Article.new
	end
	
	# Edit an Article - Form
	def edit
		@article = Article.find(params[:id])
	end
	
	
	# Save article to datatbase
	def create
	  @article = Article.new(article_params)
	  if @article.save
		redirect_to @article
	  else
		render 'new'
	  end
	end
	 
	
	# Show Article
	def show
	   @article = Article.find(params[:id])
	end
	
	
	# Update an Article
	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
		redirect_to @article
	  else
		render 'edit'
	  end
	end
	
	
	# Delete an Article
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
	 
		redirect_to articles_path
    end
	 
	
	private
	def article_params
		params.require(:article).permit(:title, :text)
	end
		  
		 
end

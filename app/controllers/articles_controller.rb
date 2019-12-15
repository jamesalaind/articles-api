class ArticlesController < ApplicationController
  before_action :authorize_request
  def index
    @articles = Article.all.order(id: :desc)
    render json: @articles, status: :ok
  end

  def create
    article = articles_params.as_json
    article['user_id'] = User.find_by_username(article['username']).id
    @articles = Article.new(article.except!('username'))
    if @articles.save
      render json: @articles, status: :created
    else
      render json: { errors: @articles.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    id = params[:id]
    article = articles_params.as_json
    article['user_id'] = User.find_by_username(article['username']).id
    @articles = Article.update(id, article.except!('username'))
    if @articles.save
      render json: @articles, status: :created
    else
      render json: { errors: @articles.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def check_duplicate
    title = params[:title]
    article = Article.find_by_title(title)
    render json: {is_unique: article.nil?}
  end

  def destroy
    Article.transaction do
      begin
        Article.delete(params[:id])
        render json: {status: :deleted}
      rescue Exception => ex
        render json: {status: :failed}
      end
    end


  end

  private
  def articles_params
    params.permit(
        :title, :description, :username
    )
  end
end

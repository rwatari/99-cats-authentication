class CatsController < ApplicationController
  before_action :verify_owner, only: [ :edit, :update ]

  def index

    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    @current_user = current_user
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def verify_owner
    if current_user.nil?
      redirect_to cat_url(params[:id])
    else
      cat_check = current_user.cats.where(id: params[:id])
      redirect_to cat_url(params[:id]) if cat_check.empty?
    end
  end

  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end

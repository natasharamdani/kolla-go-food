class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :load_reviewable, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    @review.reviewable = @reviewable
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.reviewable = @reviewable

    respond_to do |format|
      if @review.save
        format.html { redirect_to @reviewable, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:reviewer_name, :title, :description, :reviewable_id, :reviewable_type)
    end

    def load_reviewable
      klass = [Food, Restaurant].detect { |c| params["#{c.name.underscore}_id"] }
      @reviewable = klass.find(params["#{klass.name.underscore}_id"])
    end
end

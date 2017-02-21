class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.angular
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
    # @portfolio_items = Portfolio.order(:id)
  end

  def new
    @portfolio_items = Portfolio.new
  end

# this method calls on the scope method defined in the Model
  def scope_portfolio_item
    @scope_portfolio_items = Portfolio.ruby_on_rails_portfolio_items
  end

# this instance variable is calling on the self.angular method inside the Model
  def angular_portfolio_item
    @angular_portfolio_items = Portfolio.angular
  end


  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image, :main_image))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'The Portfolio ITEM was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image))
        format.html {redirect_to portfolios_path, notice: 'Your entry has been updated successfully'}
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # @portfolio_item = Portfolio.find(params[:id]).destroy
    # this call performs the lookup in the DB
    @portfolio_item = Portfolio.find(params[:id])
    # this line performs the destroy action in the DB
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'The record was successfully removed.' }
    end
  end

  def current_user
    @current_folio = Portfolio.find(params[:id])
  end

end

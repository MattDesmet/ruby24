class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end


  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image))

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
    get '/portfolio/:id' => 'products#show'
    # current_user
    # porfolios@current_folio
  end

  def current_user
    @current_folio = Portfolio.find(params[:id])
  end

end

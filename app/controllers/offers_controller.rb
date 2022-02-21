class OffersController < ApplicationController
  before_action :set_offer, only: %i[show destroy edit update]

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to @offer, notice: 'Your offer was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  # Only allow a trusted parameter "white offer" through.
  def offer_params
    params.require(:offer).permit(:name, :role, :photo, :instagram_link, :youtube_link, :spotify_link)
  end
end

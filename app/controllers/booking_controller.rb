class BookingController < ApplicationController
  before_action :set_booking, only: %i[show destroy edit update]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = params[:offer_id]

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking completed.'
    else
      render :new
    end
  end

  def show
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :date)
  end

end

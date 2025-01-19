# app/controllers/aircraft_controller.rb
class AircraftController < ApplicationController
  before_action :set_aircraft, only: [:show, :edit, :update, :destroy]

  def index
    @aircraft = Aircraft.all
  end

  def show
  end

  def new
    @aircraft = Aircraft.new
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)

    if @aircraft.save
      redirect_to @aircraft, notice: 'Aircraft was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
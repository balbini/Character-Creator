class CharactersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]


  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new
    if @character.save
      redirect_to root_path
    else
      flash[:error] = "Your character was not saved"
    end
  end
end

class CharactersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]


  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    require "open-uri"
     @character_classes = open("http://www.dnd5eapi.co/api/classes").read
     @character_classes = JSON.parse(@character_classes)["results"]
     @player_class = open("http://www.dnd5eapi.co/api/classes/1").read
     @unique_class = @character_classes
     @player_class = JSON.parse(@player_class)["index"]
     @player_class_index = @player_class.to_s
     @player_race = open("http://www.dnd5eapi.co/api/subraces").read
     @chosen_race = JSON.parse(@player_race)["results"]
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to characters_path
    else
      flash[:error] = "Your character was not saved"
    end
  end

  def show
    @characters = Character.find_by_id(params[:id])
  end

  def destroy
    if user_check
      @character = Character.find_by_id(params[:id])
      @character.destroy
      redirect_to root_path
    else
      flash[:error] = "Cannot delete other characters"
      redirect_to root_path
    end
  end

  def user_check
    @character = Character.find_by_id(params[:id])
    if current_user.id == @character.user_id
      true
    else
      false
    end
end
  private

  def character_params
    params.require(:character).permit(:name, :age, :level, :xp, :user_id, :description, :race, :class)
  end

end

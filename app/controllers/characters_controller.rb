

class CharactersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]


  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
     @character_classes = open("http://www.dnd5eapi.co/api/classes").read
     @character_classes = JSON.parse(@character_classes)["results"]
     @player_class = open("http://www.dnd5eapi.co/api/classes/1").read
     @unique_class = @character_classes
     @player_class = JSON.parse(@player_class)["index"]
     @player_class_index = @player_class.to_s
     @player_race = open("http://www.dnd5eapi.co/api/races").read
     @race_options = JSON.parse(@player_race)["results"]
     @player_subrace = ["Human", "Wood Elf", "High Elf", "Mountain Dwarf", "Hill Dwarf", "Dragonborn", "Half-Orc", "Forest Gnome", "Rock Gnome", "Tiefling", "Stout Halfling", "Lightfoot Halfling","Drow", "Half-Elf"]
    #  @subrace_options = JSON.parse(@player_subrace)["results"]
     @all_skills = open("http://www.dnd5eapi.co/api/skills").read
     @player_skills = JSON.parse(@all_skills)["results"]
     @alignment = ["Lawful Good", "Choatic Good", "Neutral Good", "Neutral", "Choatic Neutral", "Neutral Evil", "Choatic Evil", "Lawful Evil"]

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
    @character = Character.find_by_id(params[:id])
    @barbarian_feature = open("http://www.dnd5eapi.co/api/features/1").read
    @chosen_barbarian = JSON.parse(@barbarian_feature)["desc"]
    @chosen_barbarian = @chosen_barbarian
    @bard_feature = open("http://www.dnd5eapi.co/api/features/26").read
    @chosen_bard = JSON.parse(@bard_feature)["desc"]
    @cleric_feature = open("http://www.dnd5eapi.co/api/features/76").read
    @chosen_cleric = JSON.parse(@cleric_feature)["desc"]
    @druid_feature = open("http://www.dnd5eapi.co/api/features/103").read
    @chosen_druid = JSON.parse(@druid_feature)["desc"]
    @fighter_feature = open("http://www.dnd5eapi.co/api/features/139").read
    @chosen_fighter = JSON.parse(@fighter_feature)["desc"]
    @monk_feature = open("http://www.dnd5eapi.co/api/features/168").read
    @chosen_monk = JSON.parse(@monk_feature)["desc"]
    @paladin_feature = open("http://www.dnd5eapi.co/api/features/201").read
    @chosen_paladin = JSON.parse(@paladin_feature)["desc"]
    @ranger_feature = open("http://www.dnd5eapi.co/api/features/220").read
    @chosen_ranger = JSON.parse(@ranger_feature)["desc"]
    @rogue_feature = open("http://www.dnd5eapi.co/api/features/280").read
    @chosen_rogue = JSON.parse(@rogue_feature)["desc"]
    @sorcerer_feature = open("http://www.dnd5eapi.co/api/features/304").read
    @chosen_sorcerer = JSON.parse(@sorcerer_feature)["desc"]
    @warlock_feature = open("http://www.dnd5eapi.co/api/features/340").read
    @chosen_warlock = JSON.parse(@warlock_feature)["desc"]
    @wizard_feature = open("http://www.dnd5eapi.co/api/features/402").read
    @chosen_wizard = JSON.parse(@wizard_feature)["desc"]
  end

  def edit
    if user_check
      @character = Character.find_by_id(params[:id])
    else
      flash[:notice] = "Cannot edit other characters"
    end
    @character_classes = open("http://www.dnd5eapi.co/api/classes").read
    @character_classes = JSON.parse(@character_classes)["results"]
  end

  def update
    if user_check
      @character = Character.find_by_id(params[:id])
      @character.update(character_params)
      redirect_to character_path
    else
      flash[:error] = "Cannot edit other characters"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if user_check
      @character = Character.find_by_id(params[:id])
      @character.destroy
      redirect_to(characters_path)
    else
      flash[:error] = "Cannot delete other characters"
      redirect_to root_path
    end
  end

  def user_check
    @character = Character.find_by_id(params[:id])
    if current_user.id === @character.user_id
      true
    else
      false
    end
end
  private

  def character_params
    params.require(:character).permit(:id, :name, :age, :level, :xp, :user_id, :description, :race, :class_name, :alignment, :image, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :subrace, :party_id, :party_role)
  end

end

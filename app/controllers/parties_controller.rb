class PartiesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

    def index
        @parties = Party.all
    end

    def new
      @party = Party.new
    end

    def create
      @party = Party.new(party_params)
      if @party.save
        redirect_to parties_path
      end
    end

    def show
      @party = Party.find_by_id(params[:id])
    end

    def edit
      if user_check
        @party = Party.find_by_id(params[:id])
      else
        flash[:notice] = "Cannot edit other characters"
      end
    end

    def update
      if user_check
        @party = Party.find_by_id(params[:id])
        @party.update(party_params)
        redirect_to parties_path
      else
        flash[:error] = "Cannot edit other characters"
        redirect_back(fallback_location: root_path)
      end
    end

    def destroy
      if user_check
        @party = Party.find_by_id(params[:id])
        @party.destroy
        redirect_to(parties_path)
      else
        flash[:error] = "Cannot delete other characters"
        redirect_to root_path
      end
    end

    def user_check
      @party = Party.find_by_id(params[:id])
      if current_user.id === @party.user_id
        true
      else
        false
      end
    end

    private
      def party_params
        params.require(:party).permit(:id, :name, :party_members, :user_id)
      end


end

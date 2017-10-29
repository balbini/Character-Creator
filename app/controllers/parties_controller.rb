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

    private
      def party_params
        params.require(:party).permit(:id, :name, :party_members, :user_id)
      end


end

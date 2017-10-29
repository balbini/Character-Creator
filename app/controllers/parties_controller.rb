class PartiesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

    def index
    end

    def new
      @party = Party.new
    end

    def create
      @party = Party.new(party_params)
    end

    private
      def party_params
        params.require(:party).permit(:id, :name, :party_members)
      end


end

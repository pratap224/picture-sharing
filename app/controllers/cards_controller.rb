class CardsController < ApplicationController
before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


	def new
		@card = current_user.cards.build
	end	
	
	def index
		@cards =  Card.all.order("created_at DESC").paginate(:page => params[:page])
		
	end

	def show
		@card = Card.find(params[:id])
	end
	
	def edit
		@card = Card.find(params[:id])
	end

	def update
		@card = Card.find(params[:id])

		if @card.update(card_params)
			redirect_to @card, notice: 'Card was successfully updated.'
		else
			render action: 'edit'
		end
	end

	def create
		@card = current_user.cards.build(card_params)

		if @card.save
			redirect_to @card, notice: 'Card was successfully created'
		else
			render action: 'new'
		end
	end

	def destroy
		@card = Card.find(params[:id])
		@card.destroy

		redirect_to cards_path
	end
	
	private
		def set_card
			@card = Card.find(params[:id])
		end
		def correct_user
      	@card = current_user.cards.find_by(id: params[:id])
      redirect_to cards_path, notice: "Not authorized to edit this Card" if @card.nil?
   		 end
		def card_params
				params.require(:card).permit(:user_id, :title, :text, :image)
		end		
end


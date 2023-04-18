class FoodsController < ApplicationController
    def index
        @foods = Food.all
    end

    def new
        @food = Food.new
    end

    def create
        # @user = current_user
        @food = Food.create(food_params)
        @food.user_id = 1
        if @food.save
            redirect_to foods_path, notice: 'Food was successfully created.'
        else
            render :new
            flash[:alert] = 'Food was not created.'
        end
    end

    def destroy
        @food = Food.find(params[:id])
       if @food.destroy
            redirect_to foods_path
        else
            redirect_to foods_path
            
        end
    end

    private

    def food_params
        params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end
end

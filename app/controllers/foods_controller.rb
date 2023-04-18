class FoodsController < ApplicationController
    def index
        @foods = Food.all
    end

    def create
        @user = courent_user
        @food = Food.new(food_params)
        @food.user_id = @user
        if @food.save
            redirect_to foods_path, notice: 'Food was successfully created.'
        else
            render :new
            flash[:alert] = 'Food was not created.'
        end
    end

    private

    def food_params
        params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end
end

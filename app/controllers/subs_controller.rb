class SubsController < ApplicationController
    def index
        @subs = Subs.all
        render :show
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def new
        @user = current_user
        @sub = Sub.new
        render :new
    end

    def create
        @user = current_user
        @sub = Sub.new(sub_params)
        if @sub.save
            flash[:success] = ["Created a sub forum"]
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to new_sub_url
        end
    end

    # def edit

    # end

    # def update

    # end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
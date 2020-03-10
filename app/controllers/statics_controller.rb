class StaticsController < ApplicationController
    def show
        render template: "statics/#{params[:static]}"
    end
end

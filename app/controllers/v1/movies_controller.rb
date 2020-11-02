# frozen_string_literal: true

module V1
  class MoviesController < ApplicationController
    before_action :set_movies, only: :index

    def index
      render json: @movies.as_json
    end

    private

    def set_movies
      @movies = Movie.all
    end
  end
end

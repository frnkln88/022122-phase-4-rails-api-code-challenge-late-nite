class EpisodesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_episode
    before_action :set_episode, only: [:show, :update, :destroy]
  
    # GET /episodes
    def index
      @episodes = Episode.all
  
      render json: @episodes
    end
  
    # GET /episodes/1
    def show
      episode = Episode.find(params[:id])
      render json: episode, serializer: EpisodeguestSerializer
    end
  
    # POST /episodes
    def create
      @episode = Episode.new(episode_params)
  
      if @episode.save
        render json: @episode, status: :created, location: @episode
      else
        render json: @episode.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /episodes/1
    def update
      if @episode.update(episode_params)
        render json: @episode
      else
        render json: @episode.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /episodes/1
    def destroy
      @episode.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_episode
        @episode = Episode.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def episode_params
        params.fetch(:episode, {})
      end
  
      def invalid_episode
        render json: {error: 'Episode not found' }, status: :not_found
      end
  end
  
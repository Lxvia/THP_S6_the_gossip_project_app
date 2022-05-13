class LikesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @like = current_user.likes.new(like_params)
        if !@like.save
            flash[:danger] = "You already liked this gossip !"
        end
        redirect_to @like.gossip
    end

    
    def destroy
        @like = current_user.likes.find(params[:id])
        gossip = @like.post
        @like.destroy
        redirect_to gossip
    end

    private

    def like_params
        params.require(:like).permit(:gossip_id)
    end
end

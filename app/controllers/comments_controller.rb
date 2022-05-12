class CommentsController < ApplicationController
  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.new(content: params[:comment][:content], user: User.last)

    if @comment.save
      redirect_to request.referer
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
      @comment = Comment.find(params[:id])

      comment_params = params.require(:comment).permit(:content)

      if @comment.update(comment_params)
          redirect_to @comment.gossip
      else 
          render :edit 
      end

  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.gossip
  end

end

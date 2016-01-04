class SponsoredPostsController < ApplicationController

  def show
    @sponsored = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored = SponsoredPost.new
  end

  def create
     @sponsored = SponsoredPost.new
     @sponsored.title = params[:sponsored_post][:title]
     @sponsored.body = params[:sponsored_post][:body]
     @sponsored.price = params[:sponsored_post][:price]
     @topic = Topic.find(params[:topic_id])

     @sponsored.topic = @topic

      if @sponsored.save
        flash[:notice] = "Sponsored Post was saved."
        redirect_to [@topic, @sponsored]
       else
        flash.now[:alert] = "There was an error saving the Sponsored Post. Please try again."
        render :new
       end
   end

  def edit
    @sponsored = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored = SponsoredPost.find(params[:id])
    @sponsored.title = params[:sponsored_post][:title]
    @sponsored.body = params[:sponsored_post][:body]

         if @sponsored.save
           flash[:notice] = "Sponsored Post was updated."

           redirect_to [@sponsored.topic, @sponsored]
         else
           flash.now[:alert] = "There was an error saving the Sponsored Post. Please try again."
           render :edit
         end
    end

  def destroy
    @sponsored = SponsoredPost.find(params[:id])

    if @sponsored.destroy
      flash[:notice] = "\"#{@sponsored.title}\" was deleted successfully."
      redirect_to @sponsored.topic
     else
       flash.now[:alert] = "There was an error deleting the SponsoredPost."
       render :show
     end
   end
end

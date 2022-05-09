class AllPagesController < ApplicationController
  def team 

  end 
  
  def contact

  end

  def home 
    @first_name = params[:first_name] #on definit une variable @ pour pouvoir l'utiliser depuis la vue
    @gossips = Gossip.all
  end

  def gossip 
    @gossip = Gossip.find(params[:id])
  end

  def author
    @gossip = User.find(params[:first_name])
  end

end

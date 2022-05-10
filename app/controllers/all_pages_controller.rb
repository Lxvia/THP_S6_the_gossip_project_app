class AllPagesController < ApplicationController
    def team 
  
    end 
    
    def contact
  
    end
  
    def home 
      @first_name = params[:first_name] #on definit une variable @ pour pouvoir l'utiliser depuis la vue
      @gossips = Gossip.all
    end
  
    def author
      @author = User.find_by(first_name:params[:first_name])
    end
  
  end
  
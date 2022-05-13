class GossipController < ApplicationController

    def index
        #on definit une variable @ pour pouvoir l'utiliser depuis la vue
        # Méthode qui récupère tous les potins et les envoie à la view home pour affichage
    end
      
    def show
        if logged_in?
            @gossip_new = Gossip.new# Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
        else
            flash[:danger] = "You must be logged in to read a gossip"
            redirect_to "/log_in"
        end

        @gossip = Gossip.find(params[:id])# Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    end
      
    def new
        if logged_in?
            @gossip_new = Gossip.new# Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
        else
            flash[:danger] = "You must be logged in to post a gossip"
            redirect_to "/log_in"
        end
    end
      
    def create
        # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
        @gossip_new = Gossip.new(user: current_user, title: params[:title], content: params[:content])

        if @gossip_new.save
            flash[:success] = "Gossip saved !"
            redirect_to :root
        else
            render :new
            flash[:danger] = "Gossip not saved"
        end
    end
      
    def edit
        
        @gossip = Gossip.find(params[:id])

        if current_user != @gossip.user
            redirect_to :root
        end
    
        # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end
      
    def update

        @gossip = Gossip.find(params[:id])

        post_params = params.require(:gossip).permit(:title, :content)

        if @gossip.update(post_params)
            render :show
            flash[:succes] = "Gossip updated !"
        else 
            render :edit
            flash[:danger] = "Gossip not updated" 
        end
        # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params
        # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    end
      
    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to :root
        #@comment = Comment.find(params[:id])
        #@comment.destroy
        # Méthode qui récupère le potin concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end

end

class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update]

    def index
        # Méthode qui récupère tous les users et les envoie à la view index (index.html.erb) pour affichage
    end
    
    def show
        # Méthode qui récupère l'user concerné et l'envoie à la view show (show.html.erb) pour affichage
        @user = current_user
        @events = Event.where(administrator: @user)
    end
    
    def new
        # Méthode qui crée un user vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
        @user = User.new
    end
    
    def create
        # Méthode qui créé un user à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le user créé)
    end
    
    def edit
        # Méthode qui récupère le user concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end
    
    def update
        # Méthode qui met à jour le user à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params
        # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le user modifié)
    end
    
    def destroy
        # Méthode qui récupère le user concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end
end

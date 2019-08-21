class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    
    def index
        # Méthode qui récupère tous les events et les envoie à la view index (index.html.erb) pour affichage
        @events = Event.all
    end
    
    def show
        # Méthode qui récupère le event concerné et l'envoie à la view show (show.html.erb) pour affichage
        @event = Event.find(params[:id])
        @user = @event.users
        @admin = is_administrator?
        @event_finish = @event.start_date + (@event.duration*24*60*60)
        @count_attendees = Attendance.where(attended_event: params[:id]).count
        @already_attendee = already_attendee?
        


        
        puts "$"*60
        puts @admin
        puts "$"*60
        puts @attendee
        puts @attendee
        puts "$"*60
        
        

    end
    
    def new
        # Méthode qui crée un event vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
        @event = Event.new
    end
    
    def create
        # Méthode qui créé un event à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le event créé)
    @event = Event.new(title: params[:title], description: params[:description], duration: params[:duration], start_date: params[:start_date], price: params[:price], location: params[:location], administrator: current_user) 

    if @event.save
      
      flash[:notice] = "C'est bon !"
      redirect_to event_path(current_user)
    else
        #Saving failed, we can inspect @user.errors for more information
      flash.now[:error] = 'Alert message!'
      #If using a form library @user.errors will be displayed graphically when rendering the :new action
      render :new
    end
    end
    
    def edit
        # Méthode qui récupère le event concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end
    
    def update
        # Méthode qui met à jour le event à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params
        # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le event modifié)
    end
    
    def destroy
        # Méthode qui récupère le event concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end

    private 

    def is_administrator?
        @event.administrator == current_user ? true : false
    end

    def already_attendee?
        @event.users.include?(current_user) ? true : false
    end 




end

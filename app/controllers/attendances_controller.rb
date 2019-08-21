class AttendancesController < ApplicationController
    before_action :find_event
    before_action :authenticate_user!

    def index
        # Méthode qui récupère tous les attendances et les envoie à la view index (index.html.erb) pour affichage
        @attendances = Attendance.all
    end
    
    def show
        # Méthode qui récupère le attendance concerné et l'envoie à la view show (show.html.erb) pour affichage
    end
    
    def new
        # Méthode qui crée un attendance vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
         @attendance = Attendance.new 
    end
    
    def create
        # Méthode qui créé un attendance à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le attendance créé)
        @amount = @event.price

        customer = Stripe::Customer.create({
          email: params[:stripeEmail],
          source: params[:stripeToken],
        })
      
        charge = Stripe::Charge.create({
          customer: customer.id,
          amount: @amount,
          description: 'Rails Stripe customer',
          currency: 'usd',
        })
        stripe_customer_id = charge.customer

        @attendance = Attendance.new(user: current_user, attended_event: @event  , stripe_customer_id: stripe_customer_id)
        @attendance.save
        if @attendance.save
      
            flash[:notice] = "C'est bon !"
            redirect_to event_path(@event)
          else
              #Saving failed, we can inspect @user.errors for more information
            flash.now[:error] = 'Alert message!'
            #If using a form library @user.errors will be displayed graphically when rendering the :new action
            render :new
          end
      
      
    end

    
    def edit
        # Méthode qui récupère le attendance concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end
    
    def update
        # Méthode qui met à jour le attendance à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params
        # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le attendance modifié)
        
    end
    
    def destroy
        # Méthode qui récupère le attendance concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end

    private

    def find_event
        @event = Event.find(params[:event_id])
    end
    
end

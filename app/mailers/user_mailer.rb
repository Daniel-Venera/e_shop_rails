class UserMailer < ApplicationMailer

    def command_email(order)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @order = order
    
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'http://monsite.fr/login' 
    
      #  =begin
     #   @order.items.each do |each_item|
     #     if each_item.image.attached?
    #        @filename = object.id.to_s + object.image.filename.extension_with_delimiter
   #         if ActiveStorage::Blob.service.respond_to(path_for)
             # attachments.inline[@filename] = File.read(ActiveStorage::Blob.service.send(:path_for, object.image.key))
            #elsif ActiveStorage::Blob.service.respond_to(:download)
           #   attachments.inline[@filename] = object.image.download
          #  end
         # end
        #end
        #=end

        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @order.user.email, subject: 'Bienvenue chez nous !') 
      end

      def welcome_email(user)
        @user = user

        @url  = 'http://monsite.fr/login' 

        mail(to: @user.email, subject: 'Inscription')
      end


end

class PictureMailer < ApplicationMailer
	def picture_mail(contact)
	    @contact = contact
	    mail to: "corinedovonou@gmail.com" , subject: "Inquiry confirmation email"
  	end
end

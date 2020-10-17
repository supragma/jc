class WelcomeFirstTribeMemberMailer < ApplicationMailer
  def welcome_first_tribe_member(email, first_name, tribe)
    @tribe = tribe
    @first_name = first_name
    mail(to: email, subject: "Welcome Aboard Super Pal Tribe Leader!")
  end
end

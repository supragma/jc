class NotifyNewMemberMailer < ApplicationMailer
  def notify_new_member(email,
                        first_name,
                        leader_email,
                        leader_first_name,
                        leader_last_name,
                        tribe)
    @tribe = tribe
    @first_name = first_name
    @leader_email = leader_email
    @leader_first_name = leader_first_name
    @leader_last_name = leader_last_name
    mail(to: email, subject: "Welcome Aboard New Super Pal!")
  end
end

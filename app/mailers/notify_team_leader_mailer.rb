class NotifyTeamLeaderMailer < ApplicationMailer
  # Notify the team leader they have a direct report and send that info.
  def notify_team_leader(leader_email,
                         leader_first_name,
                         new_member_email,
                         new_member_first_name,
                         new_member_last_name,
                         tribe)
    @tribe = tribe
    @first_name = leader_first_name
    @new_member_first_name = new_member_first_name
    @new_member_last_name = new_member_last_name
    @new_member_email = new_member_email
    mail(to: leader_email, subject: "You have a Super Pal assigned to you!")
  end
end

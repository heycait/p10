post '/attendees' do
  @attendees_emails = params[:attendees_emails].chomp.split(',')
  @event_id = params[:event_id].to_i

  @event = Event.where(id: params[:event_id]).first
  @creator = User.where(id: @event.user_id).first

  @attendees_emails.each do |email|
    Attendee.create!(email: email, event_id: @event_id)
    shoot_email({to: email, from: @creator.email, subject: "You're Invited to #{@event.title}", message: "link to event /events/id/show something like that"})
  end



  # shoot_emails({to: 'heyy.yu@gmail.com' , from: 'caitlynmyu@gmail.com' , subject: 'testing',message: 'test'})
end
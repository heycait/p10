post '/attendees' do
  @attendees_emails = params[:attendees_emails].chomp.split(',')
  @event_id = params[:event_id].to_i

  @event = Event.where(id: params[:event_id]).first
  @creator = User.where(id: @event.user_id).first

  @attendees_emails.each do |email|
    Attendee.create!(email: email, event_id: @event_id)
    shoot_email({
      to: email,
      from: @creator.email,
      subject: "#{@creator.name} invites you to #{@event.title}",
      message:
              "<h3>#{@event.title}</h3>
               <p><strong>Date:</strong> #{@event.date}</p>
               <p><strong>Location:</strong> #{@event.location}</p>
               <p><strong>Description:</strong><br>#{@event.description}</p>
               <p><strong>RSVP to this event <a href='/events/<%= @event.id %>/show'>here</a>.</strong></p>"
      })
  end
end
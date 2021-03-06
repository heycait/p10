require 'sendgrid-ruby'

helpers do

  def shoot_email(args)
    send_grid = SendGrid::Client.new(api_user: username, api_key: email)
    # client = SendGrid::Client.new(api_user: ENV['USER'], api_key: ENV['PW'])

    email = SendGrid::Mail.new do |m|
      m.to      = args[:to]
      m.from    = args[:from]
      m.subject = args[:subject]
      m.html    = args[:message]
    end

    send_grid.send(email)
  end


end

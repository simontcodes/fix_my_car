class ClientMailer < ApplicationMailer

  def received(client)
    @client = client
    mail(to: @client.email, subject: "Car received")
  end

end

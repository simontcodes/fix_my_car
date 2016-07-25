class ClientMailer < ApplicationMailer

  def received(client,job)
    @job = job
    @client = client
    mail(to: @client.email, subject: "Car received")
  end

end

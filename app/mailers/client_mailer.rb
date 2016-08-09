class ClientMailer < ApplicationMailer

  def received(client,job)
    @job = job
    @client = client
    mail(to: @client.email, subject: "Car received")
  end

  def aproval(client)

    @client = client
    mail(to: @client.email, subject: "budget waiting for approval")
  end

  def finished(client)
    @client = client
    mail(to: @client.email, subject: "Car finished")
  end


end

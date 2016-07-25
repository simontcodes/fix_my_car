# Preview all emails at http://localhost:3000/rails/mailers/client_mailer
class ClientMailerPreview < ActionMailer::Preview

  def received()
    @job = Job.first
    @client = Client.first
    ClientMailer.received(@client,@job)
  end

end

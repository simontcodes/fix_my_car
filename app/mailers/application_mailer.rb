class ApplicationMailer < ActionMailer::Base
  # default from: "#{Figaro.env.gmail_username }@gmail.com"
  default from: "fixmycar.bitmaker@gmail.com"
  #takes the gmail username from  the figaro file
  layout 'mailer'
end

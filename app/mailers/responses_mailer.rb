# encoding: utf-8

class ResponsesMailer < ActionMailer::Base
  helper :application
  default from: "ai@tuttifruttirussia.com"

  def notify(response)
    @response = response

    @position = SUBPAGES[:career][response.position]
    @name     = "#{@response.first_name} #{@response.last_name}"

    mail to:      'career@tuttifruttirussia.com',
         bcc:     'service@tfrussia.com',
         subject: "Отклик на вакансию «#{@position}» — #{@name}"
  end
end

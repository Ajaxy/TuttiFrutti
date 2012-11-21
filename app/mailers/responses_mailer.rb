# encoding: utf-8

class ResponsesMailer < ActionMailer::Base
  helper :application
  default from: "responses@tuttifruttirussia.com"

  def notify(response)
    @response = response
    @position = SUBPAGES[:career][response.position]

    mail to:      "career@tuttifruttirussia.com",
         subject: "Новое сообщение с сайта TuttiFruttiRussia"
  end
end


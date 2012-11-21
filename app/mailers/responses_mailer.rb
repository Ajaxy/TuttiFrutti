# encoding: utf-8

class ResponsesMailer < ActionMailer::Base
  helper :application
  default from: "ai@tuttifruttirussia.com"

  def notify(response)
    @response = response
    @position = SUBPAGES[:career][response.position]

    mail to:      "career@tuttifruttirussia.com",
         bcc:     "tycooon@yandex.ru",
         subject: "Новое сообщение с сайта TuttiFruttiRussia"
  end
end

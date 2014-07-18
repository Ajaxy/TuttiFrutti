# encoding: utf-8

class FranchisingMailer < ActionMailer::Base
  helper :application
  default from: "ai@tuttifruttirussia.com"

  def notify(params)
    @params = params

    mail to:      'eshabanov@gbm-mail.com',
         bcc:     'service@tfrussia.com',
         subject: "Заявка на партнёрство (#{@params[:name]})"
  end
end

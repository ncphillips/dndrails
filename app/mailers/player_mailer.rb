class PlayerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.player_mailer.youre_invited.subject
  #
  def youre_invited
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

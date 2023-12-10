# Preview all emails at http://localhost:3000/rails/mailers/player_mailer
class PlayerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/player_mailer/youre_invited
  def youre_invited
    PlayerMailer.youre_invited
  end

end

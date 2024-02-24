class WinnerMailer < ApplicationMailer

  def congratulate
    @winner = params[:winner]
    mail(to: @winner.user.email, subject: 'Congratulations on your win!')
  end

end

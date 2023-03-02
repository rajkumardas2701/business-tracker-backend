class TransactionsMailer < ApplicationMailer
  def new_transaction_email
    @tx = params[:tx]
    mail(to: ENV.fetch('gmail', nil), subject: 'New Transaction posted')
  end
end

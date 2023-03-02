# Preview all emails at http://localhost:3000/rails/mailers/transactions_mailer
class TransactionsMailerPreview < ActionMailer::Preview
  def new_transactions_email
    tx = FinancialTransaction.new(date: '2023/02/01', amount: 10_000.0, send_receive: 'Sent', action_by: 'Raj',
                                  remark: 'Gpay')
    TransactionsMailer.with(tx: tx).new_transaction_email
  end
end

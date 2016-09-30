class LoansController < ApplicationController
  def create
    @owner = User.find(loan_params[:owner_id])
    @loan = @owner.loans.new(borrower_id: current_user.id, game_id: loan_params[:game_id])
    if @loan.save
      flash[:notice] = "Loan Requested!"
    else
      flash[:danger] = "Unable to request loan. " + @loan.errors.full_messages[0]
    end
    redirect_to user_path(current_user)
  end

  def confirm
    @loan = Loan.find(params[:loan_id])
    if @loan.status != "confirmed"
      @loan.status = "confirmed"
      if @loan.save
        flash[:notice] = "Confirmed Loan!"
      else
        flash[:danger] = "Couldn't confirm loan!"
      end
    else
      flash[:warning] = "Already Loaned Out!"
    end
    redirect_to user_path(current_user)
  end


  def destroy
    @user = User.find(owner_id: loan_params[:owner_id])
    @loan = Loan.find(loan_params[:loan_id])
    canceled_loan = @user.loans.delete(@loan)
    if canceled_loan
      flash[:notice] = "Loan Closed!"
    end
    redirect_to user_path(current_user)
  end

  private

  def loan_params
    params.permit(:owner_id, :game_id, :loan_id)
  end
end

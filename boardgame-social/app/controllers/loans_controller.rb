class LoansController < ApplicationController
  def create
    @owner = User.find(params[:owner_id])
    @loan = @owner.loans.new(borrower_id: current_user.id, game_id: params[:game_id])
    if @loan.save
      flash[:notice] = "Loan Requested!"
    else
      flash[:error] = "Unable to request loan. " + @loan.errors.full_messages[0]
    end
    redirect_to user_path(current_user)
  end

  def confirm

  end

  def retract
    
  end

  def destroy
    @user = current_user
    @borrower = User.find(params[:borrower_id])
    @game = User.find(params[:game_id])
    @loan = @user.loans.find(borrower_id: @borrower.id, game_id: @game_id, status:"confirmed")
    canceled_loan = @user.loans.delete(@loan)
    if canceled_loan
      flash[:notice] = "Loan Closed!"
    end
    redirect_to user_path(current_user)
  end
end

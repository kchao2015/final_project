class SessionsController < ApplicationController
    layout false
    skip_before_action :require_user

  def create
    # params["email"] => the email address
    # params["password"] => the password
    # Do authentication
    # Redirect to the root_path
    # Display a notice that login was either successful or unsuccessful

    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"])
      session["user_id"] = user.id
      redirect_to root_path, notice: "Welcome!"
    else
      redirect_to root_path, alert: "Please try again."
    end
  end

  def destroy
    # Do sign-out
    session["user_id"] = nil
    redirect_to root_path, notice: "You have now logged out. Please come back again."
  end

end



class IntroductionsController < ApplicationController
  layout 'introduction'
  skip_before_action :authenticate_user!

  def joint_escrow
  end

  def payments_processing
  end

  def payroll
  end
end

class DocsController < ApplicationController
  layout 'doc'
  skip_before_action :authenticate_user!
  before_action :skip_authorization
  before_action :skip_policy_scope

  def introduction
  end

  def overview_of_payment_processing
  end

  def creating_a_new_gateway
  end
end

class DocsController < ApplicationController
  layout 'doc'
  skip_before_action :authenticate!
  # skip_authorization

  def index
    skip_policy_scope
  end
end

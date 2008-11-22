# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
 include AuthenticatedSystem
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '07f887eba06b91d708f7b9631babed9b'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  before_filter :prestacoes
  def prestacoes
      @prestacoes_a_pagar = DriveFixed.find(:all, :order=>" day_limit",:conditions=>" entry = 0", :limit=>5)
      @prestacoes_a_receber = DriveFixed.find(:all, :order=>" day_limit",:conditions=>" entry = 1", :limit=>5)
  end 
end

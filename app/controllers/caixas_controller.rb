class CaixasController < ApplicationController
  def index
      @contas = self.current_user.accounts
      @drive_fixeds = DriveFixed.find(:all, :joins=>" inner join accounts as a on account_id = a.id",:conditions=>[" user_id = ?",self.current_user.id]) 
  end
end

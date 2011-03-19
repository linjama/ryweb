class OccasionTypesController < ApplicationController

   # Accoring to in_controller.rb (declarative_authorization module), 
   # all before filters must be before filter_resource_access and friends
   before_filter :login_required
   filter_resource_access

  # Destroy existing occasion types and runs in standard types
  def create
    OccasionType.with_permissions_to(:destroy).destroy_all
    
    OccasionType::STANDARD_TYPES.each do |standard_type|
      occasion_type = OccasionType.new(:name => standard_type, :visibility => 0)
      occasion_type.save!  # Raises exception if save fails.
    end

    @occasion_types = OccasionType.with_permissions_to(:index).find(:all)
    redirect_to(:action => 'index')
  end
  
  # GET /occasion_types
  # GET /occasion_types.xml
  def index
    @occasion_types = OccasionType.with_permissions_to(:index).find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occasion_types }
    end
  end

  # PUT /occasion_types
  # PUT /occasion_types.xml
  def update
    @occasion_types = OccasionType.with_permissions_to(:update).find(:all)
    visibility_ids = params[:visibility].collect {|id| id.to_i} if params[:visibility]
    visibility_ids = [nil] unless visibility_ids  # visibility_ids must be array
    
    @occasion_types.each do |occasion_type|
      if visibility_ids.include?occasion_type.id
        occasion_type.visibility = 20  # public
      else
        occasion_type.visibility = 10  # intranet
      end
      occasion_type.save!
    end
  
    redirect_to(:action => 'index')

#    respond_to do |format|
#      if @occasion_type.update_attributes(params[:occasion_type])
#        flash[:notice] = 'Tapahtumatyyppin tiedot päivitetty.'
#        format.html { redirect_to(occasion_type_url) }     
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @occasion_type.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # DELETE /occasion_types/1
  # DELETE /occasion_types/1.xml
  def destroy
    @occasion_type = OccasionType.with_permissions_to(:destroy).find(params[:id])
    @occasion_type.destroy

    respond_to do |format|
      format.html { redirect_to(occasion_types_url) }
      format.xml  { head :ok }
    end
  end
end

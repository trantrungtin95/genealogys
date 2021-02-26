class MembersController < ApplicationController
    before_action :set_member, only: [:show, :edit, :update, :destroy, :new_relationship, :create_relationship]
    before_action :set_family

    def new
        @member = Member.new(family_id: @family.id)
    end
    
    def create
        @member = Member.create(member_params)
        redirect_to user_family_members_path(@current_user, @family)
    end
    
    def index
        @members = @family.members
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end

    def new_relationship
        @members = @family.members - [@member]
        if @members == []
            redirect_to user_family_member_path(@current_user, @family, @member)
        end
    end

    def create_relationship
        @relationship = Relationship.create(member_id: params[:member_id], 
                                            relationship_name: params[:relationship_name],
                                            relative_id: params[:id])
        redirect_to user_family_member_path(@current_user, @family, @member)
    end

    private

    def set_family
        @family = Family.find(params[:family_id])
    end

    def set_member
        @member = Member.find(params[:id])
    end

    def member_params
        params.require(:member).permit(:family_id, :name, :date_of_birth)
    end
    
end

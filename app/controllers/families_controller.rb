class FamiliesController < ApplicationController
    before_action :set_family, only: [:show, :edit, :update, :destroy, :genealogy_diagram]

    def new
        @family = Family.new(user_id: @current_user.id)
    end
  
    def create
        @family = Family.create(family_params)
        redirect_to user_family_path( @current_user, @family)
    end
  
    def index
        @families = @current_user.families
    end
  
    def show
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

    def genealogy_diagram
        @members = @family.members
        result = []
        @first_member = @members.order('date_of_birth asc').first
        children = @first_member.relationships.where(relationship_name: "parent").map{|e| Member.find(e.relative_id)}
        children.each do |child|
            node = { 
                name: "#{child.name}", 
                title: "#{child.date_of_birth}",
                children: child.of_children   
            }
            result.push(node)
        end
        gon.result = result
    end

    private

    def set_family
        @family = Family.find(params[:id])
    end

    def family_params
        params.require(:family).permit(:surname, :address, :infor, :user_id)
    end
end

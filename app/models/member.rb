class Member < ApplicationRecord
    belongs_to :family
    has_many :relationships, :dependent => :destroy
    def of_children
        result = []
        children = self.relationships.where(relationship_name: "parent").map{|e| Member.find(e.relative_id)}
        children.each do |child|
            node = { 
                name: "#{child.name}", 
                title: "#{child.date_of_birth}",
                children: child.of_children   
            }
            result.push(node)
        end
        result
    end
end

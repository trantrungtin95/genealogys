module FamiliesHelper
    def get_infor_children
        infor_children = content_tag(:li) do 
            tag = content_tag(:span)
            tag += "A"
            tag += content_tag(:ul) do 
                tag = content_tag(:li) do 
                    tag = content_tag(:span)
                    tag += "B"
                    tag += content_tag(:ul) do 
                        tag = content_tag(:span)
                        tag += "C"
                    end
                end
            end
        end
    end
end

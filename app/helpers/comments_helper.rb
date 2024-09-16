module CommentsHelper
  def render_comment(comment, article, level = 0)
		
		
		border_style = level == 0 ? "0px" : "2px"
		margin_left = level == 0 ? "0vh" : "#{level + 1}vh"

    content_tag(:div, class: "container", style: "padding: 2vh; margin-left: #{margin_left}; border-left: #{border_style} solid white;  min-width: 100%;") do
			concat(content_tag(:div, class: "row", style:"align-items:center; min-width:1500px;") do
        concat(content_tag(:div, class: "col-3") do
          concat(content_tag(:i, "", class: "fa-solid fa-user", style: "font-size: 2em; margin-right: 0.8vh;"))
          concat(content_tag(:h3, link_to(comment.user.name, user_path(comment.user), style:"text-decoration: none; color: white;"), style: "display: inline-block;"))
        end)
        concat(content_tag(:div, class: "col-1") do
          concat(content_tag(:div, "#{comment.created_at.strftime("%d/%m/%Y")}"))
        end)
        concat(content_tag(:div, class: "col-1 iconContainerComment") do
					if comment.save_comments.find_by(user_id: current_user.id)
            concat(link_to(unsave_article_comment_path(id: comment.id, article_id: article.id)) do
              concat(content_tag(:i, "", class: "fa-solid fa-bookmark", style: "font-size: 1.5rem; color:white; padding-left: 2vh;"))
            end)
          else
            concat(link_to(save_article_comment_path(id: comment.id, article_id: article.id)) do
              concat(content_tag(:i, "", class: "fa-regular fa-bookmark", style: "font-size: 1.5rem; color:white; padding-left: 2vh;"))
            end)
          end
        end)
				concat(content_tag(:div, class: "col-1 iconContainerComment", style: "display: flex;") do
					concat(content_tag(:span, "#{comment.likes.length}", style: "font-size: 1.2rem; color: white;"))
					if comment.likes.find_by(user_id: current_user.id)
						concat(link_to(unlike_article_comment_path(id: comment.id, article_id: article.id), method: :post, style: "text-decoration: none; display: flex; align-items: center;") do
							concat(content_tag(:i, "", class: "fa-solid fa-heart", style: "font-size: 1.5rem; color:white; padding-left: 2vh;"))
						end)
					else
						concat(link_to(like_article_comment_path(id: comment.id, article_id: article.id), method: :post, style: "text-decoration: none; display: flex; align-items: center;") do
							concat(content_tag(:i, "", class: "fa-regular fa-heart", style: "font-size: 1.5rem; color:white; padding-left: 2vh;"))
						end)
					end
				end)
				concat(content_tag(:div, class: "col-2 iconContainerComment") do
					if current_user == comment.user
						concat(link_to(delete_article_comment_path(id: comment.id, article_id: article.id), method: :post) do
							concat(content_tag(:i, "", class: "fa-solid fa-trash", style: "font-size: 1.5rem; color:white; padding-left: 2vh;"))
						end)
					end
				end)
      end)
      concat(content_tag(:p, comment.content, style: "margin-top: 1vh; font-size: 1.2em; word-wrap: break-word; white-space:normal; width: 75%; word-break: break-all;"))

      concat(content_tag(:div, class: "reply-form") do
        form_with(model: [comment.article, comment.article.comments.build], local: true) do |form|
          concat(form.hidden_field :parent_id, value: comment.id)
          concat(content_tag(:div, class: "field") do
            form.text_area :content, rows: 2, placeholder: "Reply to this comment"
          end)
          concat(content_tag(:div, class: "actions") do
            form.submit "Reply"
          end)
        end
      end)

      if comment.replies.any?
        concat(content_tag(:div, class: "replies") do
          comment.replies.each do |reply|
            concat(render_comment(reply, article, level+1))
          end
        end)
      end
    end
  end
end

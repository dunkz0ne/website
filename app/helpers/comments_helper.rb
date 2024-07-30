module CommentsHelper
  def render_comment(comment, article, level = 0)
    content_tag(:div, class: 'comment', style: "margin-left: #{level * 20}px") do
      concat(content_tag(:p, comment.content))
      concat(content_tag(:p, "by #{comment.user.name}"))

      if current_user == comment.user
        concat(link_to('Delete', delete_article_comment_path(id: comment.id, article_id: article.id), class: "btn btn-light"))
      end

      concat(content_tag(:div, class: 'reply-form') do
        form_with(model: [comment.article, comment.article.comments.build], local: true) do |form|
          concat(form.hidden_field :parent_id, value: comment.id)
          concat(content_tag(:div, class: 'field') do
            form.text_area :content, rows: 2, placeholder: "Reply to this comment"
          end)
          concat(content_tag(:div, class: 'actions') do
            form.submit 'Reply'
          end)
        end
      end)

      if comment.replies.any?
        concat(content_tag(:div, class: 'replies') do
          comment.replies.each do |reply|
            concat(render_comment(reply, article, level+1))
          end
        end)
      end
    end
  end
end

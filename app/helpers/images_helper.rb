module ImagesHelper
  def top_score(new_post)
	all_scores = Image.order('score').reverse_order
	new_post.score = Image[0].score = 1
 end
end

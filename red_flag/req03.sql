DELETE FROM public.epix_posts
USING public.epix_hashtags, public.epix_accounts, public.people
WHERE people.id = epix_accounts.person_id
AND epix_posts.hashtag_id = epix_hashtags.id
AND epix_hashtags.name = 'EndSurveillance'
AND epix_accounts.id = epix_posts.author_id
RETURNING first_name, last_name, username, body as post_content;

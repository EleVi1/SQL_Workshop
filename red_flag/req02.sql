UPDATE public.epix_posts
SET downvotes =
upvotes * (SELECT sum(CAST(downvotes as float)/CAST(upvotes as float))
        FROM public.epix_posts
        WHERE author_id = '933' AND id != '139') / (SELECT count(*)
    FROM public.epix_posts WHERE author_id = '933' AND id != '139')
WHERE id = '139';

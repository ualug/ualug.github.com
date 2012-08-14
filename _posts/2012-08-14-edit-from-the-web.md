---
title: Editing, and creating, content for this website
layout: post
published: true
---

Editing, and creating, content for this website
===============================================

If you've got write access to the [ualug/uasite repository on GitHub][1], you can edit this website. It is built upon [Jekyll][2], a static site generator written in Ruby which powers thousands of websites, including many of [pages.github.com][3]. There's three ways to contribute content:

 - If you have Ruby installed, and are familiar with using git and the command-line, you can clone this website. If you want to preview your changes locally, you'll have to install Jekyll and run the local development server. The `_config.yml` file is set up properly enough that you'll be able to just invoke `jekyll` in the root of the repo and get started.
 
 - If you are comfortable with git, but not with Ruby, or if you just want to edit and create posts, you can do the same as above, clone the repo, but touch only the contents of `_posts/`.
 
 - Otherwise, or if you're not on your own machine, at a Uni computer for example, you can access and modify everything through [Prose][4]. Prose is a web-based content editor for GitHub, and it's what I'm using to type this very document. Go to http://prose.io/#ualug/uasite/edit/gh-pages/ and authenticate with GitHub. You'll now be able to do everything from a nice interface!


There are a few rules to respect to be able to effectively edit posts.

 - The **filenames** are of the format `YYYY-MM-DD-simple-title-alphanumerics-and-hyphens-only.<markup>`. You can use [Markdown][5] or [Textile][6], so `<format>` can either be `.textile` for Textile or `.md` (most common), `.mkd` (rare), `.markdown` (verbose) for Markdown.
 
 - The posts contain **[YAML front-matter][7]**. This is a block delimited by `---` at the top of the file. In prose, this is hidden away as "Metadata", press Ctrl+Shift+M to show it.
   
   The two most important values are `title: Something or other` which sets the post's title, and `layout: post` which sets what kind of post this is. The possible types are: `post` for a post/news, `event` for an event/announcement, `page` for a static page, and `default` to avoid all specific formatting (although I strongly discourage that!).

 - **Posts** are shown in the middle column on the front page, and setting a future date in the filename --will-- might (haven't checked) hide them. **Events**, on the other hand, are shown in the left-hand column and are always shown, even if they have future dates – that's kinda the point.


With that, you should be able to contribute content quite easily :)

[1]: https://github.com/ualug/uasite
[2]: http://jekyllrb.com
[3]: https://pages.github.com
[4]: http://prose.io
[5]: http://daringfireball.net/projects/markdown
[6]: http://textile.thresholdstate.com/
[7]: https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter
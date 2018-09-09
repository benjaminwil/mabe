layout_file=layout/layout.html
stylesheet_file=styles.css
posts_dir=src
assets_dir=assets
markdown_files:=$(shell find ${posts_dir} -type f -name '*.md')
targets:=$(markdown_files:${posts_dir}/%.md=build/%/index.html)

all: $(targets)

build/%/index.html: ${posts_dir}/%.md
	  @mkdir -p build/${assets_dir}
		@cp layout/${assets_dir}/${stylesheet_file} build/${assets_dir}/${stylesheet_file}
		@mkdir -p $(dir $@) 
			@perl vendor/markdown-v1.0.1/markdown.pl $< > $@
			@bash script/layout.sh ${layout_file} $@
			@bash script/styles.sh ${stylesheet_file} $@

clean:
		rm -Rf build

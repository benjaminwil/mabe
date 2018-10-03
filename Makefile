posts_dir=src/posts
assets_dir=src/assets

layout_file=layout/layout.html
markdown_files:=$(shell find ${posts_dir} -type f -name '*.md')

build_root_dir=build
build_assets_dir=${build_root_dir}/assets
build_targets:=$(markdown_files:${posts_dir}/%.md=${build_root_dir}/%/index.html)

all: $(build_targets)

${build_root_dir}/%/index.html: ${posts_dir}/%.md
		@cp -r ${assets_dir}/ ${build_assets_dir}
		@mkdir -p $(dir $@)
			@perl vendor/markdown-v1.0.1/markdown.pl $< > $@
			@bash script/layout.sh ${layout_file} $@

clean:
		rm -Rf build/post

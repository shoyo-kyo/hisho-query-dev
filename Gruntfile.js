
module.exports = function(grunt){

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		concat: {
			//
			//hisho-query concat
			//
			hquery: {
				options: {
					separator: "\n\n\n",
					stripBanners: true,
					banner: '@charset "utf-8";\n' +
					'/*!\n' +
					' * <%= pkg.name %> v<%= pkg.version %>\n' +
					' * <%= pkg.description %>\n' +
					' * http://query.hisho.com\n' +
					' * \n' +
					' * Copyright 2014 shoyo kyo\n' +
					' * Released under the <%= pkg.licenses[0].type %> license\n' +
					' * <%= pkg.licenses[0].url %>\n' +
					' * \n' +
					' * Date: <%= grunt.template.today("yyyy-mm-dd") %>\n' +
					' */\n\n'
				},
				dest: 'sass/hisho-query/_hquery-<%= pkg.version %>.scss',
				src:[
					'sass/hisho-query/hq-list/_help.scss',
					'sass/hisho-query/hq-list/_pop.scss',
					'sass/hisho-query/hq-list/_prepend.scss',
					'sass/hisho-query/hq-list/_remove.scss',
					'sass/hisho-query/hq-list/_reverse.scss',
					'sass/hisho-query/hq-list/_slice.scss',
					'sass/hisho-query/hq-list/_toComma.scss',
					'sass/hisho-query/hq-list/_toSpace.scss',
					'sass/hisho-query/hq-list/_shift.scss',

					'sass/hisho-query/hq-map/_help.scss',
					'sass/hisho-query/hq-map/_get-deep.scss',
					'sass/hisho-query/hq-map/_set.scss',
					'sass/hisho-query/hq-map/_set-deep.scss',
					'sass/hisho-query/hq-map/_merge-deep.scss',
					'sass/hisho-query/hq-map/_extend.scss',

					'sass/hisho-query/hq-css/_help.scss',
					'sass/hisho-query/hq-css/_get-width.scss',
					'sass/hisho-query/hq-css/_get-height.scss',
					'sass/hisho-query/hq-css/_to-map.scss',
					'sass/hisho-query/hq-css/_to-short.scss',

					'sass/hisho-query/hq-is/_help.scss',
					'sass/hisho-query/hq-is/_string.scss',
					'sass/hisho-query/hq-is/_number.scss',
					'sass/hisho-query/hq-is/_color.scss',
					'sass/hisho-query/hq-is/_map.scss',
					'sass/hisho-query/hq-is/_list.scss',
					'sass/hisho-query/hq-is/_bool.scss',

					'sass/hisho-query/hq-error/_method.scss',
					'sass/hisho-query/hq-error/_type.scss',

					'sass/hisho-query/hq-mixin/_font-cloud.scss',
					'sass/hisho-query/hq-mixin/_link-styles.scss',
					'sass/hisho-query/hq-mixin/_module.scss',
					'sass/hisho-query/hq-mixin/_module-core.scss',
					'sass/hisho-query/hq-mixin/_sprite.scss',
					'sass/hisho-query/hq-mixin/_sprite-core.scss',
					'sass/hisho-query/hq-mixin/_sprite-image.scss',
					'sass/hisho-query/hq-mixin/_write.scss',
					'sass/hisho-query/hq-mixin/_write-propaty.scss',
					'sass/hisho-query/_core.scss'
				]
			},
			hqueryFnction: {
				options: {
					separator: "\n\n\n",
					stripBanners: true,
					banner: 'require "sass"\n' +
							'#\n' +
							'# <%= pkg.name %> support functions v<%= pkg.version %>\n' +
							'# http://query.hisho.com\n' +
							'# \n' +
							'# Copyright 2014 shoyo kyo\n' +
							'# Released under the <%= pkg.licenses[0].type %> license\n' +
							'# <%= pkg.licenses[0].url %>\n' +
							'# \n' +
							'# Date: <%= grunt.template.today("yyyy-mm-dd") %>\n' +
							'# \n\n',
					footer: '\n\n' +
							'module Sass::Script::Functions\n' +
							'  include HishoQueryStr\n' +
							'  include HishoQueryMap\n' +
							'end'
				},
				dest: 'sass/hisho-query/_hquery-function-<%= pkg.version %>.rb',
				src:[
					'sass/hisho-query/hq-map/function.rb',
					'sass/hisho-query/hq-str/function.rb'
				]
			}
		},
		watch: {
			scripts: {
				files: ['**/*.js','**/*.scss','**/*.rb'],
				options: {
					spawn: false,
				},
				tasks: ['concat']
			},
		}
	});

	//load
	grunt.loadNpmTasks('grunt-contrib');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-watch');

	//tasc
	grunt.registerTask('default', ['concat','watch']);
	grunt.registerTask('dev', ['concat']);

};
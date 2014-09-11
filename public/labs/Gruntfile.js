var split = require("split")

module.exports = function(grunt) {
  grunt.initConfig({
    markdownpdf: {
      options: {
	preProcessMd: function () {
          return split(function (line) {
            return line.replace("images", __dirname + "/images") + "\n"
          })
        }
      },
      files: {
        src: "*.md",
        dest: "dest"
      }
    }
  });

  grunt.loadNpmTasks('grunt-markdown-pdf');

  grunt.registerTask('default', ['markdownpdf']);
}


const { defineConfig } = require('@vue/cli-service')

module.exports = defineConfig({
  transpileDependencies: true,
  chainWebpack: config => {
    config.module
        .rule('ico')
        .test(/\.ico$/)
        .use('file-loader')
        .loader('file-loader')
        .tap(options => {
          // 修改它的选项...
          return options
        })
  }
})

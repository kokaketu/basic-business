// 'use strict'
// const utils = require('./utils')
// const config = require('../config')

// module.exports = {
//   loaders: utils.cssLoaders({
//     sourceMap: config.build.productionSourceMap,
//     extract: config.build.productionSourceMap
//   }),
//   cssSourceMap: config.build.productionSourceMap,
//   cacheBusting: config.dev.cacheBusting,
//   transformToRequire: {
//     video: ['src', 'poster'],
//     source: 'src',
//     img: 'src',
//     image: 'xlink:href'
//   }
// }

'use strict'
const utils = require('./utils')
const config = require('../config')
const isProduction = process.env.NODE_ENV === 'production'
const sourceMapEnabled = isProduction
  ? config.build.productionSourceMap
  : config.dev.cssSourceMap

module.exports = {
  loaders: utils.cssLoaders({
    sourceMap: sourceMapEnabled,
    extract: isProduction
  }),
  cssSourceMap: sourceMapEnabled,
  cacheBusting: config.dev.cacheBusting,
  transformToRequire: {
    video: ['src', 'poster'],
    source: 'src',
    img: 'src',
    image: 'xlink:href'
  }
}
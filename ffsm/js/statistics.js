/***
 * 统计代码统一 by peilan
 * 在webpack配置文件中先引入，例如开发版
 * new HtmlWebpackPlugin({
        template: path.resolve( __dirname, 'template/index.ejs' ),
        filename: 'index.html',
        chunks: ['index','vendor','manifest'],
        title: '恋爱对象心理测试',
        cdn: '../forecastassetbundle/js/bj-report-tryjs.min.js',
        statistics: '../forecastassetbundle/js/statistics.js'
    }),
 生产版：
 statistics: JSON.stringify(sdk.formatCdnPath({ projectName: 'forecastassetbundle', afterPath: '/js/statistics.js'}))
 *
 * 在ejs中引入<script src=<%= htmlWebpackPlugin.options.statistics %>></script> 这样就OK了，是不是简单了很多
 * 就算以后修改统计代码，也不用去编译每个测算了
 */

//新大数据埋点sdk引入
//(function () {
//    //百度统计
//    window._hmt = window._hmt || [];
//    var hm = document.createElement('script');
//    hm.src = '//hm.baidu.com/hm.js?da9f609f31e08775a3c08224838230b5';
//    var s = document.getElementsByTagName('script')[0];
//    s.parentNode.insertBefore(hm, s);
//
//    //大数据sdk
//    var mta = document.createElement('script');
//    mta.src = '//aicdn.linghit.com/sense-sdk/latest/sense.sdk.min.js';
//    mta.setAttribute('crossorigin', 'anonymous');
//    var s = document.getElementsByTagName('script')[0];
//    s.parentNode.insertBefore(mta, s);
//})();

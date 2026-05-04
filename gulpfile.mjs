import gulp from "gulp";
import prefixer from "gulp-autoprefixer";
import terser from "gulp-terser";
import concat from "gulp-concat";
import sassModule from "gulp-sass";
import cleanCSS from "gulp-clean-css";
import sourcemaps from "gulp-sourcemaps";
import rename from "gulp-rename";
// import rimraf from "gulp-rimraf";
import sassCompiler from "sass";

const sass = sassModule(sassCompiler);

const path = {
    src: {
        scss: "src/scss/",
        scss_bw: "src/scss_bw/",
        scss_wb: "src/scss_wb/",
        scss_cw: "src/scss_cw/",
        scss_yb: "src/scss_yb/",
        js: "src/js/",
        npm: "node_modules/",
        bower: "bower_components/",
    },
    dest: {
        css: "./modx/assets/",
        js: "./modx/assets/js/",
        // chunks: '../../../Shelter/!Sites/R_SMIBS/assets/components/_elements/chunks/',
        // templates: '../../../Shelter/!Sites/R_SMIBS/assets/components/_elements/templates/',
        // resources: '../../../Shelter/!Sites/R_SMIBS/core/cache/libfig/resource/',
        // login: '../../../Shelter/!Sites/R_SMIBS/libvault/templates/default/css/'
    },
    watch: {
        scss: "src/scss/",
        scss_bw: "src/scss_bw/",
        scss_wb: "src/scss_wb/",
        scss_cw: "src/scss_cw/",
        scss_yb: "src/scss_yb/",
        js: "src/js/",
        // chunks_dev: '_develop/_elements/chunks/*.tpl',
        // templates_dev: '_develop/_elements/templates/*.tpl',
        // chunks: '../../../Shelter/!Sites/R_SMIBS/assets/components/_elements/chunks/**/*.tpl',
        // templates: '../../../Shelter/!Sites/R_SMIBS/assets/components/_elements/templates/**/*.tpl'
    },
};

/*----------  SCSS  ----------*/

function buildStyles() {
    return (
        gulp
            .src(path.src.scss + "main.scss")
            // .pipe(sass({
            //   silenceDeprecations: ['import']
            // }).on('error', sass.logError))
            .pipe(sourcemaps.init())
            .pipe(sass().on("error", sass.logError))
            .pipe(
                prefixer({
                    overrideBrowserslist: ["last 4 versions"],
                    cascade: false,
                }),
            )
            .pipe(
                cleanCSS({
                    compatibility: "ie8",
                }),
            )
            .pipe(
                sourcemaps.write(".", {
                    addComment: true,
                    mapFile: function (mapFilePath) {
                        return mapFilePath.replace(".scss", ".map");
                    },
                }),
            )
            .pipe(gulp.dest(path.dest.css))
    );
}

function ajaxformScss() {
    return gulp
        .src(path.src.scss + "ajaxform.scss")
        .pipe(sass())
        .pipe(
            prefixer({
                overrideBrowserslist: ["last 2 versions"],
                cascade: false,
            }),
        )
        .pipe(
            cleanCSS({
                compatibility: "ie8",
            }),
        )
        .pipe(gulp.dest(path.dest.css));
}

function loginScss() {
    return gulp
        .src(path.src.scss + "login.scss")
        .pipe(sass())
        .pipe(
            prefixer({
                overrideBrowserslist: ["last 2 versions"],
                cascade: false,
            }),
        )
        .pipe(
            cleanCSS({
                compatibility: "ie8",
            }),
        )
        .pipe(
            rename({
                suffix: "-min",
            }),
        )
        .pipe(gulp.dest(path.dest.login));
}

/*----------  JS  ----------*/

function mainJs() {
    return gulp
        .src([
            path.src.npm + "tiny-slider/dist/" + "tiny-slider.js",
            path.src.npm + "bxslider/dist/" + "jquery.bxslider.js",
            path.src.js + "CalendarSearch.js",
            path.src.js + "Modal.js",
            path.src.js + "main.js",
        ])
        .pipe(concat("main.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function appJs() {
    return gulp
        .src([path.src.js + "app.js", path.src.js + "CalendarSearch.js"])
        .pipe(concat("app.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function navJs() {
    return gulp
        .src([
            path.src.js + "blind.js",
            path.src.js + "nav.js",
            path.src.js + "sharing.js",
        ])
        .pipe(concat("nav.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function pageJs() {
    return gulp
        .src([
            path.src.npm + "magnific-popup/dist/" + "jquery.magnific-popup.js",
            path.src.js + "page.js",
        ])
        .pipe(concat("page.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function contactJs() {
    return gulp
        .src([
            path.src.npm + "inputmask/dist/" + "jquery.inputmask.bundle.js",
            path.src.js + "jqueryForm.js",
            path.src.js + "contact.js",
        ])
        .pipe(concat("contact.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function libraryJs() {
    return gulp
        .src([path.src.js + "library.js"])
        .pipe(concat("library.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function infoJs() {
    return gulp
        .src([path.src.js + "info.js"])
        .pipe(concat("info.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function newsJs() {
    return gulp
        .src([path.src.js + "news.js"])
        .pipe(concat("news.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function gridderPageJs() {
    return gulp
        .src([path.src.js + "gridderPage.js"])
        .pipe(concat("gridderPage.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function filterBookJs() {
    return gulp
        .src([
            path.src.npm + "isotope-layout/dist/" + "isotope.pkgd.js",
            path.src.js + "filterBook.js",
        ])
        .pipe(concat("filterBook.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function filterLibraryJs() {
    return gulp
        .src([path.src.js + "filterLibrary.js"])
        .pipe(concat("filterLibrary.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function snowJs() {
    return gulp
        .src([
            path.src.js + "snow-3d-vendor.js",
            path.src.js + "snow-3d.js",
            path.src.js + "snow_ny.js",
        ])
        .pipe(concat("snow_ny.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function threeJs() {
    return gulp
        .src([
            path.src.npm + "three/build/" + "three.js",
            path.src.js + "GLTFLoader.js",
            path.src.js + "OrbitControls.js",
            path.src.js + "threeVendor.js",
        ])
        .pipe(concat("threeVendor.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function threeSceneJs() {
    return gulp
        .src([path.src.js + "threeScene.js"])
        .pipe(concat("threeScene.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function davWingsJs() {
    return gulp
        .src([path.src.js + "3d_davWings.js"])
        .pipe(concat("3d_davWings.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function vendorJs() {
    return gulp
        .src([
            path.src.npm + "gsap/dist/" + "gsap.js",
            path.src.npm + "gsap/dist/" + "ScrollToPlugin.js",
            path.src.npm + "gsap/dist/" + "ScrollTrigger.js",
            path.src.npm + "imagesloaded/" + "imagesloaded.pkgd.js",
            // path.src.js + "gridder.js",
            // path.src.npm + "jscrollpane/script/" + "jquery.jscrollpane.js",
            // path.src.npm + "jscrollpane/script/" + "jquery.mousewheel.js",
            path.src.js + "vendor.js",
        ])
        .pipe(concat("vendor.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function preloaderJs() {
    return gulp
        .src([path.src.js + "preloader.js"])
        .pipe(concat("preloader.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

function anniversaryJs() {
    return gulp
        .src([path.src.js + "anniversary2025.js"])
        .pipe(concat("anniversaryDay.js"))
        .pipe(terser())
        .pipe(rename({ suffix: "-min" }))
        .pipe(gulp.dest(path.dest.js));
}

/*----------  Recources  ----------*/

function cleanResourcesCache() {
    return gulp
        .src(path.dest.resources + "*", { read: false })
        .pipe(rimraf({ force: true }));
}

/*----------  Watch  ----------*/

function watchFiles() {
    gulp.watch(path.watch.scss + "*.scss", buildStyles);
    gulp.watch(path.watch.scss + "ajaxform.scss", ajaxformScss);
    gulp.watch(path.watch.scss + "login.scss", loginScss);
    gulp.watch(
        [
            path.watch.js + "main.js",
            path.watch.js + "pagephotoswipe.js",
            path.src.js + "CalendarSearch.js",
            path.src.js + "Modal.js",
        ],
        mainJs,
    );
    gulp.watch(
        [
            path.watch.js + "blind.js",
            path.watch.js + "nav.js",
            path.watch.js + "sharing.js",
        ],
        navJs,
    );
    gulp.watch(path.watch.js + "app.js", appJs);
    gulp.watch(path.watch.js + "page.js", gulp.series(pageJs));
    gulp.watch(path.watch.js + "preloader.js", gulp.series(preloaderJs));
    gulp.watch(path.watch.js + "vendor.js", gulp.series(vendorJs));
    //   gulp.watch(path.watch.js + 'contact.js', gulp.series('contact-js'));
    //   gulp.watch(path.watch.js + 'library.js', gulp.series('library-js'));
    //   gulp.watch(path.watch.js + 'info.js', gulp.series('info-js'));
    //   gulp.watch(path.watch.js + 'news.js', gulp.series('news-js'));
    //   gulp.watch(path.watch.js + 'snow_ny.js', gulp.series('snow-js'));
    //   gulp.watch(path.watch.js + 'gridderPage.js', gulp.series('gridderPage-js'));
    gulp.watch(path.watch.js + "filterBook.js", gulp.series(filterBookJs));
    //   gulp.watch(path.watch.js + 'filterLibrary.js', gulp.series('filterLibrary-js'));

    //   gulp.watch(path.watch.js + 'threeVendor.js', gulp.series('three-js'));
    //   gulp.watch(path.watch.js + 'threeScene.js', gulp.series('threeScene-js'));
    //   gulp.watch(path.watch.js + '3d_davWings.js', gulp.series('3d_davWings-js'));

    //   gulp.watch(path.watch.js + 'anniversary2025.js', gulp.series('anniversary-js'));
    //   gulp.watch(path.watch.chunks, gulp.series('clean-resources-cache'));
    //   gulp.watch(path.watch.templates, gulp.series('clean-resources-cache'));
}

// export { buildStyles };
// export { ajaxformScss };
// export { loginScss };
// export { mainJs };
// export { navJs };
// export { cleanResourcesCache };
export { watchFiles as watch };

// Для дефолтной задачи:
export default gulp.series(
    buildStyles,
    ajaxformScss,
    loginScss,
    mainJs,
    appJs,
    navJs,
    watchFiles,
);

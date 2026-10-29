<!doctype html>
<!--[if IE 8]>
<html lang="ru" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="rus"> <!--<![endif]-->
{'head'|chunk}
<body>
<div class="wrapper">
    {'header'|chunk}

    <div class="page">
        <div class="section__grid">
            <div class="section__grid_description">
                <div class="section__grid_header">
                    <div class="page__title section__grid_title">
                        <h1>{$_modx -> resource.pagetitle}</h1>
                    </div>
                    <div class="page__title page__subtitle">
                        <h1>{$_modx -> resource.introtext}</h1>
                    </div>
                    <div class="page__breadcrumbs">
                        {'breadcrumbs' | chunk}
                    </div>
                </div>
                <div class="section__grid_text">
                    <p>{$_modx -> resource.content}</p>
                </div>
            </div>

            <div class="section__grid_image">
                <picture>
                    <img src="{$_modx -> resource.readImage}"
                         alt="{$_modx -> resource.pagetitle}. {$_modx -> resource.introtext}">
                </picture>
                <span class="section__grid_age">16+</span>
            </div>
        </div>
        <div class="section__grid">
            <p>{$_modx -> resource.librarySelect}</p>
        </div>
        <div class="section__grid section__grid_footer">
            <div class="section__grid_warning">
                <div class="section__grid_warning_icon">
                    <?xml version="1.0" encoding="UTF-8"?>
                    <svg id="Layer_2" data-name="Layer 2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384.52 345.28">
                        <g id="Layer_1-2">
                            <path class="cls-1"
                                  d="M192.1,345.26c-48.61,0-97.22-.02-145.84.02-8.75,0-17.04-1.71-24.37-6.62-9.82-6.58-17.31-15.1-20.13-26.88-2.06-8.59-2.79-17.36.39-25.86,1.61-4.31,3.77-8.46,6.07-12.46,25.84-44.83,51.82-89.59,77.64-134.44,18.77-32.59,37.36-65.29,56.06-97.93,3.43-5.99,6.99-11.92,10.54-17.85,6.92-11.59,16.83-19.28,30.11-22.07,13.88-2.92,26.78-.5,38.11,8.4,3.93,3.08,7.21,6.9,9.7,11.17,15.62,26.8,31.11,53.69,46.63,80.55,26.65,46.12,53.27,92.26,79.93,138.37,6.24,10.78,12.63,21.48,18.93,32.22,3.62,6.17,6.33,12.67,7.72,19.74,5.66,28.91-15.95,48.6-34.85,52.51-3.45.72-7.05,1.06-10.58,1.06-48.69.07-97.38.05-146.08.05ZM192.48,321.47c49.41,0,98.81,0,148.22,0,.88,0,1.76,0,2.63-.12,5.09-.69,9.12-3.29,12.32-7.19,4.07-4.96,6.1-10.59,5.29-17.11-.46-3.73-1.95-6.99-3.82-10.21-16.92-29.14-33.82-58.3-50.62-87.51-20.21-35.13-40.29-70.33-60.48-105.46-10.13-17.62-20.36-35.18-30.6-52.73-1.81-3.1-3.78-6.12-5.91-9.01-3.73-5.05-8.68-7.85-15.1-8.31-7.42-.53-13.66,1.62-18.57,7.19-1.6,1.81-2.87,3.94-4.08,6.04-29.66,51.3-59.29,102.61-88.92,153.92-18.89,32.71-37.78,65.41-56.59,98.17-3.53,6.14-3.9,12.71-.95,19.22,3.85,8.51,10.46,13.11,19.93,13.12,49.09.03,98.17.01,147.26.01ZM207.14,165.41c0-7.31-.08-14.63.02-21.94.18-14.55.52-29.09.67-43.64.08-7.85-6-14.47-13.75-15.32-7.88-.86-15.31,4.23-16.83,11.95-.6,3.05-.42,6.27-.37,9.42.38,24.82.81,49.63,1.22,74.45.28,16.94.54,33.89.8,50.83.12,7.49,6.07,13.44,13.45,13.41,7.37-.03,13.23-5.91,13.36-13.35.36-21.94.74-43.88,1.11-65.81.11,0,.22,0,.33,0ZM192.34,256.94c-9.95-.01-18.02,8.02-18.03,17.94-.01,10.03,8.03,18.08,18.03,18.05,9.99-.03,17.96-8.01,17.96-17.99,0-9.97-8-17.99-17.96-18Z"/>
                        </g>
                    </svg>
                </div>
                <span class="section__grid_warning_text">{$_modx -> resource.librarySpeaker}</span>
            </div>
            <span></span>
        </div>
    </div>
</div>

{'footer'|chunk}
{'scripts'|chunk}
</body>
</html>
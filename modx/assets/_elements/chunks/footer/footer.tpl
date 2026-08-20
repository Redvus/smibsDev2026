{'footerBanners' | chunk}
<footer class="footer">
    <div class="footer__top">
        <div class="footer__block">
            <div class="footer__block_top">
                <a href="{$_modx -> config.site_url}">
                    {'smibsLogoNew' | chunk}
                </a>
                <span>{$_modx -> config.site_nameFull}</span>
            </div>
            <div class="footer__block_bottom">
                <div class="footer__block_social">
                    {'socialBlock' | chunk}
                </div>
            </div>
        </div>
        <div class="footer__block">
            <div class="footer__block_contact">
                <span>{$_modx -> config.adressLegal}</span>
                <span>{$_modx -> config.adressPhysics}</span>
            </div>
        </div>
        <div class="footer__block">
            <div class="footer__block_contact">
                <span><i class="fas fa-phone"></i>&nbsp;<a
                        href="tel:{$_modx -> config.phoneBuh | phone_clear}">{$_modx -> config.phoneContact_1}</a></span>
                <span><i class="fas fa-phone"></i>&nbsp;<a
                        href="tel:{$_modx -> config.phoneBuh | phone_clear}">{$_modx -> config.phoneBuh}&nbsp;(Бухгалтерия)</a></span>
                <span><i class="fas fa-envelope"></i>&nbsp;<a
                        href="mail:{$_modx -> config.companyEmail}">{$_modx -> config.companyEmail}</a></span>
            </div>
        </div>
        <div class="footer__block">
            <div class="footer__block_bottom">
                <nav id="nav" class="footer__nav" role="navigation">
                    {'!pdoMenu' | snippet: [
                        'parents' => 0,
                        'level' => 3,
                        'outerTpl' => 'outerTpl',
                        'rowTpl' => 'rowTpl',
                        'sortby' => 'menuindex',
                        'sortdir' => 'asc',
                        'hereClass' => 'active',
                        'outerClass' => 'nav'
                    ]}
                </nav>
            </div>
        </div>
    </div>
    <div class="footer__bottom">
        <div class="footer__copyright">
            <span>®&nbsp;{'footer-year-begin' | snippet: ['start' => '2007']}</span>
        </div>
        <div class="footer__counter">

        </div>
    </div>
</footer>
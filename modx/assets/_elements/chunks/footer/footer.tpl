<footer class="footer">
    <div class="footer__top">
        <div class="footer__block">
            <div class="footer__block_top">
                <a href="{$_modx -> config.site_url}">
                    {'smibsLogoNew' | chunk}
                </a>
                <span>{$_modx -> config.companyName}</span>
            </div>
            <div class="footer__block_bottom">
                <div class="footer__block_social">
                    {* <a href="{$_modx -> config.companyVK}" target="_blank"><i class="fab fa-vk"></i></a>
                    <a href="{$_modx -> config.companyMAX}" target="_blank">
                        {'iconMAX' | chunk}
                    </a> *}
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
                        href="tel:{$_modx -> config.phoneBuh | phone_clear}">{$_modx -> config.phoneBuh}</a></span>
                <span><i class="fas fa-envelope"></i>&nbsp;<a
                        href="mail:{$_modx -> config.companyEmail}">{$_modx -> config.companyEmail}</a></span>
            </div>
        </div>
        <div class="footer__block">
            <div class="footer__block_bottom">
                <nav id="nav" class="footer__nav" role="navigation">
                    {* {'!pdoMenu' | snippet: [
                        'parents' => 0,
                        'level' => 3,
                        'outerTpl' => 'outerTpl',
                        'innerTpl' => 'innerTpl',
                        'parentRowTpl' => 'parentRowTpl',
                        'innerRowTpl' => 'innerRowTpl',
                        'rowTpl' => 'rowTpl',
                        'sortby' => 'menuindex',
                        'sortdir' => 'asc',
                        'hereClass' => 'active',
                        'outerClass' => 'nav'
                    ]} *}
                     <ul>
                        <li>Библиотеки</li>
                        <li>Учреждение</li>
                        <li>Читателям</li>
                        <li>Услуги</li>
                        <li>Деятельность</li>
                        <li>Краеведение</li>
                        <li>Электронные библиотеки</li>
                        <li>Коллегам</li>
                        <li>Виртуальная библиотека</li>
                        <li>Электронный каталог</li>
                     </ul>
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
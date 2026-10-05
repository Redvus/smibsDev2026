/*==================================
=            Navigation            =
==================================*/

/*---------  Nav Mobile  ---------*/
const navButtonMobile = document.getElementById("navButtonMobile");
const navMainMobile = document.getElementById("navMainMobile");
const navMainListMobile = document.querySelectorAll("#navMainMobile ul > li");
const navBack = document.querySelector(".nav-mobile__mask");
const navButtonLineTop = document.querySelector(".nav-button-line__top");
const navButtonLineMiddle = document.querySelector(".nav-button-line__middle");
const navButtonLineBottom = document.querySelector(".nav-button-line__bottom");

// Убедимся, что все элементы найдены, прежде чем добавлять обработчики
if (navButtonMobile && navMainMobile && navBack) {
    const navMenuOpenMobile = () => {
        const tl = gsap.timeline({ reversed: true });

        tl.to(navBack, {
            duration: 0.4,
            delay: -1,
            autoAlpha: 1,
            display: "block",
            ease: "power1",
        })
            .to(navMainMobile, {
                duration: 0.4,
                delay: -1.2,
                x: "0%",
                ease: "power2",
            })
            .to(navButtonLineMiddle, {
                duration: 0.3,
                delay: -0.6,
                rotation: "180deg",
                ease: "power2",
            })
            .to(navButtonLineTop, {
                duration: 0.3,
                delay: -0.6,
                rotation: "135deg",
                x: "27%",
                y: "200%",
                scaleX: 0.6,
                ease: "power2",
            })
            .to(navButtonLineBottom, {
                duration: 0.3,
                delay: -0.6,
                rotation: "-135deg",
                x: "27%",
                y: "-200%",
                scaleX: 0.6,
                ease: "power2",
            })
            .from(navMainListMobile, {
                duration: 0.3,
                delay: -0.5,
                stagger: 0.07,
                x: "20%",
                autoAlpha: 0,
                ease: "back",
            });

        const toggleTimeline = () => {
            tl.reversed() ? tl.restart() : tl.reverse();
        };

        navButtonMobile.addEventListener("click", toggleTimeline);
        navBack.addEventListener("click", () => tl.reverse());
    };
    navMenuOpenMobile();
}

/**
 * Замена для jQuery slideToggle/slideUp.
 * Добавляет класс 'submenu-open' и управляет высотой через CSS.
 * Для работы требует добавления CSS-стилей для .sub-menu.
 */
const navMenuChildrenMobile = () => {
    const parents = document.querySelectorAll(".nav-main__children");

    parents.forEach((parent) => {
        const link = parent.querySelector("a");
        const subMenu = parent.querySelector(".sub-menu");

        if (link && subMenu) {
            link.addEventListener("click", (event) => {
                event.preventDefault();

                const isOpening = !parent.classList.contains("submenu-open");

                // Закрыть все другие открытые подменю
                parents.forEach((p) => {
                    if (p !== parent) {
                        p.classList.remove("submenu-open");
                        p.querySelector(".sub-menu").style.maxHeight = null;
                    }
                });

                // Открыть или закрыть текущее
                if (isOpening) {
                    parent.classList.add("submenu-open");
                    subMenu.style.maxHeight = subMenu.scrollHeight + "px";
                } else {
                    parent.classList.remove("submenu-open");
                    subMenu.style.maxHeight = null;
                }
            });
        }
    });
};

/*=====  End of Navigation  ======*/

/* Search Wide
-------------------------------------------------- */
const searchForm = document.querySelector(".header__search");
const searchInput = document.querySelector(".header__search-input");
const headerTopSocial = document.querySelector(".header__social");
const clickWrapper = document.querySelector(".main-content");

if (searchForm && searchInput && headerTopSocial && clickWrapper) {
    const searchWide = () => {
        const tl = gsap.timeline({ reversed: true });

        tl.to(headerTopSocial, {
            duration: 0.4,
            delay: -1,
            autoAlpha: 0,
            ease: "circ",
        }).to(searchForm, {
            duration: 0.4,
            delay: -0.8,
            width: "50%",
            ease: "circ",
        });

        const toggleTimeline = () => {
            tl.reversed() ? tl.restart() : tl.reverse();
        };

        searchInput.addEventListener("click", toggleTimeline);
        clickWrapper.addEventListener("click", () => tl.reverse());
    };
    searchWide();
}

/* End of Search Wide
-------------------------------------------------- */

const initPage = () => {
    // Функция blindMenuActive() не определена в этом файле.
    // Если она существует в другом месте, убедитесь, что она загружена.
    // blindMenuActive();
};

const initPageMobile = () => {
    // navMenuOpenMobile() вызывается выше при проверке элементов
    navMenuChildrenMobile();
};

// Инициализация в зависимости от ширины экрана
if (window.matchMedia("(min-width: 1025px)").matches) {
    initPage();
} else {
    initPageMobile();
}

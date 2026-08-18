{if $_modx->resource.id == 1}
    <script  type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            const buttonSwitch = document.createElement('div');
            const wrapper = document.querySelector('.wrapper');
            const wrapperBack = document.querySelector('#prototypeFront');

            if (wrapper && wrapperBack) {
                buttonSwitch.style.position = 'fixed';
                buttonSwitch.style.top = '0';
                buttonSwitch.style.right = '0';
                buttonSwitch.style.width = '50px';
                buttonSwitch.style.height = '50px';
                buttonSwitch.style.backgroundColor = '#fff';
                buttonSwitch.style.zIndex = '1000';
                buttonSwitch.style.cursor = 'pointer';

                wrapper.appendChild(buttonSwitch);

                buttonSwitch.addEventListener('click', () => {
                    wrapperBack.style.opacity = wrapperBack.style.opacity === '0' ? '0.1' : '0';
                });
            }
        });
    </script>

{elseif $_modx->resource.id == 11}
    <script type="text/javascript">
        const teaserList = document.querySelector('.teaser-list');
        const examples = document.querySelector('.examples');
        const opinions = document.querySelector('.opinions');
        const mainForm = document.querySelector('.form-payment__payment');
        const courses = document.querySelector('#courses');

        // teaserList.style.opacity = '0';
        // teaserList.style.display = 'none';
        // examples.style.opacity = '0';
        // examples.style.display = 'none';
        // courses.style.opacity = '0';
        // courses.style.display = 'none';
        // opinions.style.opacity = '0';
        // opinions.style.display = 'none';
        // mainForm.style.opacity = '0';
        // mainForm.style.display = 'none';
    </script>

    {* 3. Подключаем FormIt JS *}
    <script src="assets/components/formit/js/web/formit.js" defer></script>

    {* <script src="https://www.google.com/recaptcha/api.js" async="" defer=""></script> *}
{/if}

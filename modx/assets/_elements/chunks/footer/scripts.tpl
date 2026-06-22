

{if $_modx->resource.id == 11}
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
        courses.style.opacity = '0';
        courses.style.display = 'none';
        opinions.style.opacity = '0';
        opinions.style.display = 'none';
        // mainForm.style.opacity = '0';
        // mainForm.style.display = 'none';
    </script>

    {* 3. Подключаем FormIt JS *}
    <script src="assets/components/formit/js/web/formit.js" defer></script>

    <script src="/assets/build/js/selectLitForm.js"></script>

    {* <script src="https://www.google.com/recaptcha/api.js" async="" defer=""></script> *}
{/if}


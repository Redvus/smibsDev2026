<form class="section-service__search" action="[[~[[+landing:default=`[[*id]]`]]]]" method="{$_pls.method}">
    <input class="section-service__search-input" type="search" name="{$_pls.searchIndex}" id="{$_pls.searchIndex}" value="{$_pls.searchValue}" placeholder="{$_modx->lexicon('simplesearch.search')}" autocomplete="off" autocorrect="off" />
    <input type="hidden" name="id" value="{$_pls.landing}" />
    <button type="submit" class="section-service__search-button" value="" /><i class="fa fa-search"></i></button>
</form>
<?php
/**
 * branchOptions
 *  mode = migx   → "ЦГБ==21||Филиал №1==22"  (для MIGX inputOptionValues)
 *  mode = select → "<option value="21">ЦГБ</option>..."  (для <select>)
 *  mode = json   → [{id:21,title:"ЦГБ"}, ...]  (если понадобится в JS)
 */
$parents = (int) $modx->getOption('parents', $scriptProperties, 13);
$mode    = $modx->getOption('mode', $scriptProperties, 'select');
$tpl     = $modx->getOption('tpl', $scriptProperties, '');

switch ($mode) {
    case 'migx':
        $tpl = $tpl ?: '@INLINE [[+pagetitle]]==[[+id]]';
        $sep = '||';
        break;
    case 'json':
        $tpl = $tpl ?: '@INLINE {"id":[[+id]],"title":"[[+pagetitle]]"}';
        $sep = ',';
        break;
    case 'select':
    default:
        $tpl = $tpl ?: '@INLINE <option value="[[+id]]">[[+pagetitle]]</option>';
        $sep = '';
        break;
}

$out = $modx->runSnippet('pdoResources', [
    'parents'         => $parents,
    'limit'           => 0,
    'sortby'          => 'pagetitle',
    'sortdir'         => 'ASC',
    'tpl'             => $tpl,
    'outputSeparator' => $sep,
    'showUnpublished' => 0,
]);

if ($mode === 'json') return '[' . $out . ']';
return $out;
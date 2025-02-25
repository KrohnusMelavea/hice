<?php

namespace common\generators;

require_once("{$_SERVER['DOCUMENT_ROOT']}/common/models/detailed_house_listing_item.php");

function generate_house_listing_item($house_listing_item /* detailed_house_listing_item */): string {
 $HOUSE_LISTING_ITEM_TEMPLATE = file_get_contents("{$_SERVER['DOCUMENT_ROOT']}/templates/house_listing_item.html");
 return sprintf($HOUSE_LISTING_ITEM_TEMPLATE, $house_listing_item->id, $house_listing_item->address);
}

?>
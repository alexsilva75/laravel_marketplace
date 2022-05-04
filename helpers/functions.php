<?php

function filterItemsByStoreId(Array $items,int $storeId){
    return array_filter($items, function($item) use($storeId){
        return $item['store_id'] == $storeId;
    });
}
